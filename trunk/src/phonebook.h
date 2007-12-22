#ifndef PHONEBOOKWINDOW_H
#define PHONEBOOKWINDOW_H

#include <QtGui>
#include <QtCore>
#include <iostream>

#include "fritzbox.h"
#include "PBmodell.h"

class PhonebookWindow : public QWidget
{
	Q_OBJECT

	public:
	PhonebookWindow( QSettings& _settings,QWidget *parent, PBModell& PM);
	
	FritzBox 	*fritzbox;
	QSettings& 	settings;
	PBModell& 	PhoneBookModell;

	signals:
		void OnCloseWindow();
		void OnUpdate();
		
	public slots :
		void UpdateSettings();

	private slots:
		void CloseWindow();
		void ItemClicked(int index); 
		void Phonebook_loaded();
		void upload();
	private:
// 		QPushButton  *closeButton;
		QTableView   *tabelle;
		QTableWidget *tableWid;
		QHeaderView  *tabhead;
};

#endif
