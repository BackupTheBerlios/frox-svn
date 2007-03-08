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
{
	createActions();
	//ToolBars
	hauptToolBar = addToolBar(tr("default"));
	hauptToolBar->addAction(refreshAct);
	
	//Menü
	fileMenu = menuBar()->addMenu(tr("&Datei"));
	fileMenu->addAction(refreshAct);
	fileMenu->addSeparator();
	fileMenu->addAction(exitAct);
	
	
	AnrufModell *modell = new AnrufModell(this);
	QTableView *tabelle = new QTableView(this);
	tabelle->setModel(modell);
	this->setCentralWidget(tabelle);
	this->statusBar()->show();
	
// 	http = new QHttp("fritz.box",80,&app);
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
	statusBar()->showMessage(tr("Fertig"));
}
