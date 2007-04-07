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
#include "phonebook.h"
		

class HauptFenster :public QMainWindow{
	Q_OBJECT

public slots:
	void ReadProgress(int done,int total);
	void ShowWindow();
			
public:
	HauptFenster(PBModell *PM);
	~HauptFenster();
	QSettings settings;
	PhonebookWindow *PbWindow;
	PBModell *PhoneBook;
	
private slots:
	void refreshFritz();
	void PhonebookUpload();
	void Calls_loaded();
	void TabChanged(int index);
	
private:

	void createActions();
	void readSettings();
	void writeSettings();
	QToolBar *hauptToolBar;
	QMenu *fileMenu;
	QAction *refreshAct;
	QAction *uploadAct;
// 	QAction *PhoneBookOpen;
	QAction *exitAct;
	QHttp *http;
	FritzBox *fritzbox;
	AnrufModell *modell;
	QTableView *tabelle;
	QTabWidget *tabWidget;
};


