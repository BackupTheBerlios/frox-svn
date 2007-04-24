#include <QtGui>
#include <iostream>

#include "notification.h"
//der Konstruktor
NotificationWindow::NotificationWindow(QSettings & cfg)
 : settings(cfg)
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
	
	bleft = new QPushButton("<");
	connect(bleft,SIGNAL(clicked()), this, SLOT(bleftClicked()));
	bright = new QPushButton(">");
	connect(bright,SIGNAL(clicked()), this, SLOT(brightClicked()));
	
	bleft->setEnabled(false);
	bright->setEnabled(false);
	
	LabelTitle = new QLabel("");
	LabelId = new QLabel("");
	
	LabelNumber = new QLabel("");
	LabelDatetime = new QLabel("");
	LabelMsn = new QLabel("");
	
	LabelTitle->	setFont(QFont("Arial",  10, QFont::Bold));
	LabelNumber->	setFont(QFont("Arial", 18, QFont::Bold));
	LabelMsn->	setFont(QFont("Arial", 14, QFont::Normal));
	LabelDatetime->	setFont(QFont("Arial", 14, QFont::Normal));
		
	QHBoxLayout *hbox = new QHBoxLayout;
	hbox->addWidget(LabelTitle);
	hbox->addWidget(LabelId);
	hbox->addWidget(bleft);
	hbox->addWidget(bright);
	
	QHBoxLayout *hbox2 = new QHBoxLayout;
	hbox2->addWidget(LabelNumber);
	hbox2->addWidget(LabelDatetime);
	
	QHBoxLayout *hbox3 = new QHBoxLayout;
	hbox3->addWidget(LabelMsn);
		
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
// 	QSettings settings(QSettings::IniFormat,QSettings::UserScope,QCoreApplication::organizationName(),QCoreApplication::applicationName());
	
	settings.beginGroup("Notification");
	QPoint pos = settings.value("pos", QPoint(200, 200)).toPoint();
	QSize size = settings.value("size", QSize(400, 400)).toSize();
	settings.endGroup();
	resize(size);
	move(pos);
}

 void NotificationWindow::writeSettings()
{
// 	QSettings settings(QSettings::IniFormat,QSettings::UserScope,QCoreApplication::organizationName(),QCoreApplication::applicationName());
	settings.beginGroup("Notification");
	settings.setValue("pos", pos());
	settings.setValue("size", size());
	settings.endGroup();
}
