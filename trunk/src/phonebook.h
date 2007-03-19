#ifndef PHONEBOOKWINDOW_H
#define PHONEBOOKWINDOW_H

#include <QtGui>
#include <iostream>


#include "fritzbox.h"
#include "PBmodell.h"


 class PhonebookWindow : public QWidget
{
	Q_OBJECT

	public:
	PhonebookWindow( QSettings& _settings,QWidget *parent = 0);

	signals:
		void OnCloseWindow();

	private slots:
		void CloseWindow();
		void ItemClicked(int index); 
	private:
		QPushButton  *closeButton;
		QTableView   *tabelle;
		QTableWidget *tableWid;
		QHeaderView  *tabhead;
		QSettings& settings;
 		PBModell *PhoneBookModell;
		FritzBox *fritzbox;
};

#endif
