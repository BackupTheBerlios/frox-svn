#include <QApplication>


#include "hauptfenster.h"
#include "trayicon.h"

QSystemTrayIcon *trayicon;

int main(int argc,char** argv){
	QApplication app(argc,argv);
	//trayicon = new QSystemTrayIcon(QIcon("bilder/connect_no.png"),&app);
	//trayicon->setvisible();
	

	HauptFenster mw;
	trayicon = new Callmonitor(&app);
	
	mw.show();
	
	return app.exec();

}
