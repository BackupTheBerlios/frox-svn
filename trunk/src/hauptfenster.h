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
		

class HauptFenster :public QMainWindow{
	Q_OBJECT
public:
	HauptFenster();
private slots:
	void refreshFritz();
private:
	void createActions();
	QToolBar *hauptToolBar;
	QMenu *fileMenu;
	QAction *refreshAct;
	QAction *exitAct;
	QHttp *http;
};
