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
:settings(QSettings::IniFormat,QSettings::UserScope,QCoreApplication::organizationName(),QCoreApplication::applicationName()), PbWindow(NULL)
{
	createActions();
	readSettings();
	
	setWindowTitle(tr("frox"));
	
	//ToolBars
	hauptToolBar = addToolBar(tr("default"));
	hauptToolBar->addAction(refreshAct);
	hauptToolBar->addAction(uploadAct);
	
	//Menü
	fileMenu = menuBar()->addMenu(tr("&Datei"));
	fileMenu->addAction(refreshAct);
	fileMenu->addSeparator();
	fileMenu->addAction(exitAct);
	
	
	//Anrufliste
	modell  = new AnrufModell(this);
	connect(modell,SIGNAL(liste_geladen()), this, SLOT(Calls_loaded()));
	tabelle = new QTableView(this);
	tabelle->setModel(modell);
	tabelle->resizeColumnsToContents();
	
	//Telefonbuch
	PbWindow = new PhonebookWindow( settings, this);
	connect(uploadAct, SIGNAL(triggered()), PbWindow, SLOT(upload()));
	
	//Tabbing
	tabWidget = new QTabWidget;
// 	QTabBar *tBar;
// 	tBar = tabWidget->tabBar();
// 	tabWidget->tabBar()->setVisible(false);
	tabWidget->addTab(tabelle,  tr("List of Calls"));	
	tabWidget->addTab(PbWindow, tr("Phonebook"));	
	connect(tabWidget,SIGNAL(currentChanged(int)), this, SLOT(TabChanged( int )));
	
	this->setCentralWidget(tabWidget);
// 	this->setCentralWidget(tabelle);
	this->statusBar()->show();
	
	//Wird im Klartext abgespeichert!!
	fritzbox = new FritzBox(this, settings.value("common/password", "").toString());
	
	connect(fritzbox,SIGNAL(neue_anrufliste(QString ,QChar )),modell,SLOT(neue_liste(QString , QChar )));	
}

HauptFenster::~HauptFenster(){
	writeSettings();
	if (PbWindow != NULL) delete PbWindow;
}

void HauptFenster::createActions()
{
	refreshAct = new QAction(QIcon("bilder/reload.png"), tr("&Refresh"), this);
	refreshAct->setShortcut(tr("Ctrl+R"));
	refreshAct->setStatusTip(tr("Refresh"));
	connect(refreshAct, SIGNAL(triggered()), this, SLOT(refreshFritz()));
	
	uploadAct = new QAction(QIcon("bilder/upload.png"), tr("&Upload"), this);
	uploadAct->setShortcut(tr("Ctrl+U"));
	uploadAct->setStatusTip(tr("phonebook upload"));
	uploadAct->setVisible(false);
// 	connect(uploadAct, SIGNAL(triggered()), this, SLOT(PhonebookUpload()));
	
	
	exitAct = new QAction(QIcon("bilder/application-exit.png"), tr("&Beenden"), this);
	exitAct->setShortcut(tr("Alt+F4"));
	exitAct->setStatusTip(tr("Beenden"));
	connect(exitAct, SIGNAL(triggered()), this, SLOT(close()));
}

void HauptFenster::refreshFritz()
{
	switch (tabWidget->currentIndex()) {
	case 0: 
// 		setEnabled(false);
		fritzbox->hole_anrufliste();
		statusBar()->showMessage(tr("Lade Anrufliste"));
		break;
		
	case 1: 
		PbWindow->fritzbox->hole_telefonbuch();
		statusBar()->showMessage(tr("Lade Telefonbuch"));
		break;
	}
}

void HauptFenster::PhonebookUpload()
{
	
}

void HauptFenster::TabChanged( int index)
{
	switch (index) {
		case 0: uploadAct->setVisible(false);
			break;
		
		case 1: uploadAct->setVisible(true);
			break;
	}
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

 void HauptFenster::Calls_loaded()
 {
	tabelle->resizeColumnsToContents();
	setEnabled(true);
	statusBar()->showMessage(tr("Anrufliste geladen"));	
 }
 
 void HauptFenster::ReadProgress(int done, int total)
 {
	 statusBar()->showMessage(QString::number(done, 10) + " bytes received");	
 }

 void HauptFenster::ShowWindow()
 {
	 show();
 }

 
