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
public:
	HauptFenster();
	~HauptFenster();
	QSettings settings;

private slots:
	void refreshFritz();
	void OpenPhoneBook();
	void PhoneBookClosed();
private:

	void createActions();
	void readSettings();
	void writeSettings();
	QToolBar *hauptToolBar;
	QMenu *fileMenu;
	QAction *refreshAct;
	QAction *PhoneBookOpen;
	QAction *exitAct;
	QHttp *http;
	FritzBox *fritzbox;
	AnrufModell *modell;
	QTableView *tabelle;
	PhonebookWindow *PbWindow;
};


