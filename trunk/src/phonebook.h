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
		PhonebookWindow(QWidget *parent = 0);

	private:
		QPushButton *closeButton;
		QTableView  *tabelle;
// 		QStandardItemModel *PBmodell;
 		PBModell *PhoneBookModell;
		FritzBox *fritzbox;
};

#endif
