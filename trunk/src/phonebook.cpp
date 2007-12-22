#include <QtGui>

#include "phonebook.h"
#include <iostream>
//der Konstruktor
PhonebookWindow::PhonebookWindow( QSettings& _settings, QWidget *parent, PBModell& PM)
	: QWidget(parent),settings(_settings), PhoneBookModell(PM),tabhead(NULL)
{
	setWindowFlags(Qt::Tool);
	setWindowTitle(tr("Phonebook"));
	
	QVBoxLayout *layout 	= new QVBoxLayout;

// 	PhoneBookModell 	= new PBModell();
// 	PhoneBookModell 	= PM;
	connect(&PhoneBookModell,SIGNAL(liste_geladen()), this, SLOT(Phonebook_loaded()));
	tabelle		= new QTableView(this);
	tabhead		= tabelle->horizontalHeader();

	PhoneBookModell.LoadFromFile("phonebook.csv");
	tabelle->setSortingEnabled(true);
	tabelle->setModel(&PhoneBookModell);
	
	connect(tabhead, SIGNAL(sectionClicked(int)), this, SLOT(ItemClicked(int)));
	layout->addWidget(tabelle);
	
// 	tabhead->setResizeMode(QHeaderView::ResizeToContents); 
 
// 	closeButton = new QPushButton(tr("&Close"));
// 	connect(closeButton, SIGNAL(clicked()), this, SLOT(CloseWindow()));
// 	layout->addWidget(closeButton);

	setLayout(layout);

//  	fritzbox = new FritzBox("password");
// 	fritzbox = new FritzBox(parent,settings.value("common/password", "").toString());
	fritzbox = new FritzBox(parent,settings);
	connect(fritzbox,SIGNAL(neues_telefonbuch(QString)),&PhoneBookModell,SLOT(neue_liste(QString)));
	connect(this, SIGNAL(OnUpdate()), fritzbox, SLOT(UpdateSettings()));
// 	fritzbox->hole_telefonbuch();
}

void PhonebookWindow::CloseWindow(){
	PhoneBookModell.SaveToFile("phonebook.csv");
	close();	
	emit OnCloseWindow();
}

void PhonebookWindow::ItemClicked(int index){
	tabelle->sortByColumn(index);
}

void PhonebookWindow::Phonebook_loaded(){
	tabelle->resizeColumnsToContents();
	setEnabled(true);
	PhoneBookModell.SaveToFile("phonebook.csv");
}

void PhonebookWindow::upload(){	
	QByteArray data="";
	PhoneBookModell.SaveToFile("phonebook.csv");
	data = PhoneBookModell.upload_phonebook();
	fritzbox->holeSeite(data);
}

void PhonebookWindow::UpdateSettings(){emit OnUpdate();}



