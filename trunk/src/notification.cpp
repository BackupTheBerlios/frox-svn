#include <QtGui>
#include <iostream>

#include "notification.h"
//der Konstruktor
NotificationWindow::NotificationWindow()
{
	Qt::WindowFlags flags = 0;
	flags = Qt::Tool;
// 	flags |= Qt::FramelessWindowHint; 	// rahmenlos machen
	flags |= Qt::WindowStaysOnTopHint;	//Always on Top
	
	setWindowFlags(flags);
	setLineWidth ( 4 );
	setFrameShape(QFrame::StyledPanel);
	setFrameShadow(QFrame::Sunken);
	
	readSettings();	
	
	QPushButton *bleft = new QPushButton("<");
	QPushButton *bright = new QPushButton(">");
	QLabel	*title = new QLabel("Incoming Call: ");
	QLabel	*id = new QLabel("id");
	
	QLabel	*number = new QLabel("number");
	QLabel	*datetime = new QLabel("datetime");
	QLabel	*msn = new QLabel("MSN");
		
	QHBoxLayout *hbox = new QHBoxLayout;
	hbox->addWidget(title);
	hbox->addWidget(id);
	hbox->addWidget(bleft);
	hbox->addWidget(bright);
	
	QHBoxLayout *hbox2 = new QHBoxLayout;
	hbox2->addWidget(number);
	hbox2->addWidget(datetime);
	
	QHBoxLayout *hbox3 = new QHBoxLayout;
	hbox3->addWidget(msn);
		
	closeButton = new QPushButton(tr("&Close"));
 	connect(closeButton, SIGNAL(clicked()), this, SLOT(CloseWindow()));
	
	QVBoxLayout *layout = new QVBoxLayout;
 	layout->addLayout(hbox,0);
	layout->addLayout(hbox2,0);
	layout->addLayout(hbox3,0);
 	layout->addWidget(closeButton);
	layout-> setMargin(2);
	layout-> setSpacing(5);
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
