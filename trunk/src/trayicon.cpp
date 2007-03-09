//
// C++ Implementation: trayicon
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#include "trayicon.h"

Callmonitor::Callmonitor(QApplication * parent)
:QSystemTrayIcon(QIcon("bilder/connect_no.png"),parent),verbindung(false)
{
	setVisible(true);
	
	//Kontextmenu
	QAction *exitAct = new QAction(QIcon("bilder/application-exit.png"), tr("&Beenden"), this);
	exitAct->setShortcut(tr("Alt+F4"));
	exitAct->setStatusTip(tr("Beenden"));
	connect(exitAct, SIGNAL(triggered()), parent, SLOT(quit()));
	QMenu *contextmenu = new QMenu();
	contextmenu->addAction(exitAct);
	setContextMenu(contextmenu);
	
	//Klickereignis
	connect(this, SIGNAL(activated(QSystemTrayIcon::ActivationReason)), this, SLOT(onclick(QSystemTrayIcon::ActivationReason)));
	
	//Netzwerkteil
	netz = new QTcpSocket(this);
	netz->connectToHost("fritz.box",1012);
	connect(netz, SIGNAL(connected()), this, SLOT(verbunden())); 
	connect(netz, SIGNAL(error(QAbstractSocket::SocketError )), this, SLOT(fehler(QAbstractSocket::SocketError )));
	connect(netz, SIGNAL(readyRead()), this, SLOT(neuedaten()));
}

Callmonitor::~Callmonitor(){
	delete netz;
}

void Callmonitor::neuedaten()
{
	QTextStream input(netz);
	//Zwischenspeichern?? oder gleich hier verarbeiten?
	FBMessage nachricht(input.readLine());
	if (nachricht.isDisconnect()){
		schlange[nachricht.id].Disconnect();
	}else{
		if (schlange.size() <= nachricht.id){
			schlange.resize(nachricht.id+1);
		}
		schlange[nachricht.id]=nachricht;
		
	}
	showMessage("Debug",nachricht.toString());
}

void Callmonitor::onclick(QSystemTrayIcon::ActivationReason reason ){
	switch (reason){
		case QSystemTrayIcon::Context:
			//showMessage("Debug","context");
			break;
		case QSystemTrayIcon::DoubleClick:
			showMessage("Debug","doppelt geklicked");
			break;
		case QSystemTrayIcon::Trigger:
			//showMessage("Debug","einmal geklicked");
			break;
		case QSystemTrayIcon::MiddleClick:
			showMessage("Debug","mitte geklickt");
			break;
		case QSystemTrayIcon::Unknown:
		default:
			showMessage("Debug","Unknown");
	}
}

void Callmonitor::verbunden(){
	showMessage("Debug","Fritz!Box gefunden");
}
void Callmonitor::fehler(QAbstractSocket::SocketError socketError ) {
	showMessage("Fehler",netz->errorString ());
}