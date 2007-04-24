//
// C++ Interface: trayicon
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#ifndef TRAYICON_H
#define TRAYICON_H
#include <QtGui>
#include <QSystemTrayIcon>
#include <QtNetwork>
#include <QIcon>
#include "types.h"
#include "PBmodell.h"
		
#include "notification.h"

class Callmonitor :public QSystemTrayIcon{
	Q_OBJECT
	
private:
	void ShowSpecificCall(int id);
	QSettings & settings;
	QTcpSocket *netz;
	bool verbindung;
	QString datenbuffer;
	
	NotificationWindow *alert;
	int visibleCall;
	PBModell *PhoneBook;

public:
	Callmonitor(QApplication * parent, PBModell * PM, QSettings& cfg);
	~Callmonitor();
	
	QVector<FBMessage> schlange;//Daraus soll ein Modell werden!!
	int CallCount;
	
public slots:
	void neuedaten();
	void verbunden();
	void getrennt();
	
	void fehler(QAbstractSocket::SocketError socketError );
	void onclick(QSystemTrayIcon::ActivationReason reason );
	void UpdateSettings();
	
	void NotificationClosed();
	void ShowNextCall();
	void ShowPrevCall();

	signals:
	void TrayDoubleClicked();
	void GetNameFromNumber(QString number);
};

#endif /*TRAYICON_H*/
