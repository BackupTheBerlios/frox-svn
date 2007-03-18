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

	Callmonitor temp(&app);
	trayicon = &temp;
	
	HauptFenster mw;
	mw.show();
	
	return app.exec();

}

