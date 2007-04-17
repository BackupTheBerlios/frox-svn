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
#include "importdialog.h"
#include "settingswindow.h"
		

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
	void Calls_loaded();
	void TabChanged(int index);
	void SaveDialog();
	void ImportDialog();
	void ShowSettings();
	
private:

	void createActions();
	void readSettings();
	void writeSettings();
	QToolBar *hauptToolBar;
	QMenu *fileMenu;
	QMenu *settMenu;
	QAction *refreshAct;
	QAction *uploadAct;
	QAction *SavePBAct;
	QAction *LoadPBAct;
	QAction *SettAct;
	QAction *exitAct;
	QHttp *http;
	FritzBox *fritzbox;
	AnrufModell *modell;
	QTableView *tabelle;
	QTabWidget *tabWidget;
};


