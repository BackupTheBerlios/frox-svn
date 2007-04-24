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

Callmonitor::Callmonitor(QApplication * parent, PBModell * PM, QSettings& cfg)
:QSystemTrayIcon(QIcon(":/bilder/connect_no.png"),parent), settings(cfg), verbindung(false), alert(NULL), CallCount(0)
{
	PhoneBook = PM;
	setVisible(true);
	
	//Kontextmenu
	QAction *exitAct = new QAction(QIcon(":/bilder/application-exit.png"), tr("&Beenden"), this);
	exitAct->setShortcut(tr("Alt+F4"));
	exitAct->setStatusTip(tr("Beenden"));
	connect(exitAct, SIGNAL(triggered()), parent, SLOT(quit()));
	QMenu *contextmenu = new QMenu();
	contextmenu->addAction(exitAct);
	setContextMenu(contextmenu);
	
	//Klickereignis
	connect(this, SIGNAL(activated(QSystemTrayIcon::ActivationReason)), this, SLOT(onclick(QSystemTrayIcon::ActivationReason)));
	
	//Netzwerkteil
	QString Host;
	int Port;
	Host = settings.value("common/IP", "fritz.box").toString();
	Port = settings.value("common/Port", "1012").toInt();
	netz = new QTcpSocket(this);
	netz->connectToHost(Host,Port);
	connect(netz, SIGNAL(connected()), this, SLOT(verbunden())); 
	connect(netz, SIGNAL(disconnected()), this, SLOT(getrennt())); 
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
	if (nachricht.CallTerminated()){ 	//augelegt > Anruf entfernen
		schlange[nachricht.id].Disconnect();
		CallCount--;
		if ((CallCount == 0) && (alert != NULL)) alert->close();
		return;
	}
	if (nachricht.CallStarted()){ 	//Verbindung zustande gekommen
		schlange[nachricht.id].Rufnummer 	= nachricht.Rufnummer;
		schlange[nachricht.id].Nebenstelle 	= nachricht.Nebenstelle; 
	}
	else //ganz neue Verbindung
	{ 				
		if (schlange.size() <= nachricht.id){ 
			schlange.resize(nachricht.id+1);
		}
		schlange[nachricht.id]=nachricht;
		CallCount++;
		
	}
//  	showMessage("Debug",nachricht.toString());
	showMessage("Debug","Calls: "+ QString::number(CallCount,10) + " | " + QString::number(nachricht.id,10));
	if (alert == NULL) {
		alert = new NotificationWindow(settings);
		connect(alert, SIGNAL(nextCall()),this,SLOT(ShowNextCall()));
		connect(alert, SIGNAL(prevCall()),this,SLOT(ShowPrevCall()));
		connect(alert, SIGNAL(OnCloseWindow()),this,SLOT(NotificationClosed()));
	}
	
	if ( CallCount > 1 ) {
		alert->bleft->setEnabled(true);
		alert->bright->setEnabled(true);
	}
	else {
		alert->bleft->setEnabled(false);
		alert->bright->setEnabled(false);
	}	
	
	ShowSpecificCall(nachricht.id);
	
}

void Callmonitor::ShowNextCall(){
	int id = 0;
	
	if (CallCount < 1) return;
	
	id = visibleCall + 1;
	if (id >= CallCount) id = 0;
	ShowSpecificCall(id);
}

void Callmonitor::ShowPrevCall(){
	int id = 0;
	
	if (CallCount < 1) return;
	
	id = visibleCall - 1;
	if (id < 0) id = CallCount-1;
	ShowSpecificCall(id);
}

void Callmonitor::ShowSpecificCall(int id)
{	
	if (alert == NULL) return;
	
	alert->LabelId->setText(QString::number(id, 10));
	
	if (schlange[id].incoming == true) 
		alert->LabelTitle->setText("Incoming Call :");
	else
		alert->LabelTitle->setText("Outgoing Call :");
		
	alert->LabelNumber->setText(PhoneBook->NameFromNumber(schlange[id].Rufnummer));
	alert->LabelDatetime->setText(schlange[id].marke.toString("hh:mm:ss dd.MM.yyyy"));
	alert->LabelMsn->setText(schlange[id].MSN);
	alert->show();
	
	visibleCall = id;
}

void Callmonitor::onclick(QSystemTrayIcon::ActivationReason reason ){
	switch (reason){
		case QSystemTrayIcon::Context:
			//showMessage("Debug","context");
			break;
		case QSystemTrayIcon::DoubleClick:
			emit TrayDoubleClicked();
			//showMessage("Debug","doppelt geklicked");
			break;
		case QSystemTrayIcon::Trigger:
			emit TrayDoubleClicked();
			//showMessage("Debug","einmal geklicked");
			break;
		case QSystemTrayIcon::MiddleClick:
// 			showMessage("Debug","mitte geklickt");
			break;
		case QSystemTrayIcon::Unknown:
		default:
// 			showMessage("Debug","Unknown");
			break;
	}
}

void Callmonitor::verbunden(){
	showMessage("Debug","Fritz!Box gefunden");
}

void Callmonitor::getrennt(){
	showMessage("Debug","Fritz!Box getrennt");
	
}

void Callmonitor::UpdateSettings(){
	netz->disconnectFromHost();
	
	QString Host;
	int Port;
	Host = settings.value("common/IP", "fritz.box").toString();
	Port = settings.value("common/Port", "1012").toInt();
	netz->connectToHost(Host,Port);
}


void Callmonitor::fehler(QAbstractSocket::SocketError socketError ) {
	showMessage("Fehler",netz->errorString ());
}

void Callmonitor::NotificationClosed()
{
 	delete alert;
	alert = NULL;
}



