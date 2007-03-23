#include <QtGui>
#include <iostream>

#include "notification.h"
//der Konstruktor
NotificationWindow::NotificationWindow()
{
	setWindowFlags(Qt::Tool); 
	readSettings();	
	
	QVBoxLayout *layout 	= new QVBoxLayout;

	closeButton = new QPushButton(tr("&Close"));
 	connect(closeButton, SIGNAL(clicked()), this, SLOT(CloseWindow()));
 	layout->addWidget(closeButton);

	setLayout(layout);
}

void NotificationWindow::CloseWindow(){
	writeSettings();
	close();	
	emit OnCloseWindow();
}

void NotificationWindow::readSettings()
{
// 	QSettings settings("Trolltech", "Application Example");
	QSettings settings(QSettings::IniFormat,QSettings::UserScope,QCoreApplication::organizationName(),QCoreApplication::applicationName());
	
	settings.beginGroup("Notification");
	QPoint pos = settings.value("pos", QPoint(200, 200)).toPoint();
	QSize size = settings.value("size", QSize(400, 400)).toSize();
	settings.endGroup();
	resize(size);
	move(pos);
}

 void NotificationWindow::writeSettings()
{
	QSettings settings(QSettings::IniFormat,QSettings::UserScope,QCoreApplication::organizationName(),QCoreApplication::applicationName());
	settings.beginGroup("Notification");
	settings.setValue("pos", pos());
	settings.setValue("size", size());
	settings.endGroup();
}