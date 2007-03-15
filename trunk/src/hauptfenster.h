//
// C++ Interface: hauptfenster
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#include <QtGui>
#include <QtNetwork>
#include "modell.h"
#include "fritzbox.h"
		

class HauptFenster :public QMainWindow{
	Q_OBJECT
public:
	HauptFenster();
	~HauptFenster();
private slots:
	void refreshFritz();
private:
	void createActions();
	void readSettings();
	void writeSettings();
	QToolBar *hauptToolBar;
	QMenu *fileMenu;
	QAction *refreshAct;
	QAction *exitAct;
	QHttp *http;
	FritzBox *fritzbox;
	QSettings settings;
};
