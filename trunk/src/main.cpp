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
	QSettings cfg(QSettings::IniFormat,QSettings::UserScope,QCoreApplication::organizationName(),QCoreApplication::applicationName());
	
	HauptFenster mw(PM, cfg);
	mw.show();
		
	Callmonitor temp(&app, &PM, cfg);
	trayicon = &temp;
	QObject::connect(&temp, SIGNAL(TrayDoubleClicked()), &mw, SLOT(ShowWindow()));
	QObject::connect(&mw, SIGNAL(SettingsChanged()), &temp, SLOT(UpdateSettings()));
		
	return app.exec();
}

