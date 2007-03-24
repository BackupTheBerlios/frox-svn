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
	
	QVector<FBMessage> schlange;//Daraus soll ein Modell werden!!
	int CallCount;
	
public slots:
	void neuedaten();
	void verbunden();
	void fehler(QAbstractSocket::SocketError socketError );
	void onclick(QSystemTrayIcon::ActivationReason reason );
	
	void NotificationClosed();

	signals:
	void TrayDoubleClicked();

private:
	void ShowSpecificCall(int id);
	
	QTcpSocket *netz;
	bool verbindung;
	QString datenbuffer;
	
	NotificationWindow *alert;
};

#endif /*TRAYICON_H*/
