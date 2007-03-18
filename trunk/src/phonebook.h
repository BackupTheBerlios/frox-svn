#ifndef PHONEBOOKWINDOW_H
#define PHONEBOOKWINDOW_H

#include <QWidget>
#include <QtGui>
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

	private:
		QPushButton *closeButton;
		QTableView  *tabelle;
 		PBModell *PhoneBookModell;
		FritzBox *fritzbox;
};

#endif
