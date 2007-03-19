#ifndef PHONEBOOKWINDOW_H
#define PHONEBOOKWINDOW_H

#include <QWidget>
#include <QtGui>
#include <QModelIndex>
#include <iostream>


#include "fritzbox.h"
#include "PBmodell.h"

 class QPushButton;
 class QTextEdit;

 class PhonebookWindow : public QWidget
{
	Q_OBJECT

	public:
	PhonebookWindow(QWidget *parent = 0, QString password = "");

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
 		PBModell *PhoneBookModell;
		FritzBox *fritzbox;
};

#endif
