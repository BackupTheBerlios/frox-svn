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
		
#include "notification.h"


class Callmonitor :public QSystemTrayIcon{
	Q_OBJECT
public:
	Callmonitor(QApplication * parent);
	~Callmonitor();
public slots:
	void neuedaten();
	void verbunden();
	void fehler(QAbstractSocket::SocketError socketError );
	void onclick(QSystemTrayIcon::ActivationReason reason );
	void NotificationClosed();

private:
	QTcpSocket *netz;
	bool verbindung;
	QString datenbuffer;
	QVector<FBMessage> schlange;//Daraus soll ein Modell werden!!
	
	NotificationWindow *alert;

};

#endif /*TRAYICON_H*/
