//
// C++ Implementation: hauptfenster
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#include "hauptfenster.h"

HauptFenster::HauptFenster()
:settings(QSettings::IniFormat,QSettings::UserScope,QCoreApplication::organizationName(),QCoreApplication::applicationName())
{
	createActions();
	readSettings();
	
	//ToolBars
	hauptToolBar = addToolBar(tr("default"));
	hauptToolBar->addAction(refreshAct);
	
	//Menü
	fileMenu = menuBar()->addMenu(tr("&Datei"));
	fileMenu->addAction(refreshAct);
	fileMenu->addSeparator();
	fileMenu->addAction(exitAct);
	
	
	modell = new AnrufModell(this);
	tabelle = new QTableView(this);
	tabelle->setModel(modell);
	tabelle->resizeColumnsToContents();
	this->setCentralWidget(tabelle);
	this->statusBar()->show();
	
	//Wird im Klartext abgespeichert!!
	fritzbox = new FritzBox(settings.value("common/password", "").toString());
	
	connect(fritzbox,SIGNAL(neue_anrufliste(QString ,QChar )),modell,SLOT(neue_liste(QString , QChar )));
	
}

HauptFenster::~HauptFenster(){
	writeSettings();
}

void HauptFenster::createActions()
{
	refreshAct = new QAction(QIcon("bilder/reload.png"), tr("&Refresh"), this);
	refreshAct->setShortcut(tr("Ctrl+R"));
	refreshAct->setStatusTip(tr("Refresh"));
	connect(refreshAct, SIGNAL(triggered()), this, SLOT(refreshFritz()));
	
	exitAct = new QAction(QIcon("bilder/application-exit.png"), tr("&Beenden"), this);
	exitAct->setShortcut(tr("Alt+F4"));
	exitAct->setStatusTip(tr("Beenden"));
	connect(exitAct, SIGNAL(triggered()), this, SLOT(close()));
}

void HauptFenster::refreshFritz()
{
	fritzbox->hole_anrufliste();

	//fritzbox->hole_telefonbuch();
	statusBar()->showMessage(tr("Fertig"));
}

 void HauptFenster::readSettings()
 {
	settings.beginGroup("HauptFenster");
	QPoint pos = settings.value("pos", QPoint(200, 200)).toPoint();
	QSize size = settings.value("size", QSize(400, 400)).toSize();
	settings.endGroup();
	resize(size);
	move(pos);
 }
 
  void HauptFenster::writeSettings()
 {
	settings.beginGroup("HauptFenster");
	settings.setValue("pos", pos());
	settings.setValue("size", size());
	settings.endGroup();
 }
