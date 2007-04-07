#include <QApplication>

#include "hauptfenster.h"
#include "trayicon.h"

QSystemTrayIcon *trayicon;

void beenden(QObject * obj){
	//Programm Ende!
	
}

int main(int argc,char** argv){
	QApplication app(argc,argv);

	QCoreApplication::setOrganizationName("frox");
	QCoreApplication::setOrganizationDomain("frox.berlios.com");
	QCoreApplication::setApplicationName("frox");
	
	PBModell PM;
	
	HauptFenster mw(&PM);
	mw.show();
		
	Callmonitor temp(&app, &PM);
	trayicon = &temp;
	QObject::connect(&temp, SIGNAL(TrayDoubleClicked()), &mw, SLOT(ShowWindow()));
	
	return app.exec();
}

