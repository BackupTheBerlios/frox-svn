#include <QtGui>

#include "phonebook.h"
#include <iostream>
//der Konstruktor
PhonebookWindow::PhonebookWindow( QSettings& _settings, QWidget *parent)
	: QWidget(parent),tabhead(NULL),settings(_settings)
{
	setWindowFlags(Qt::Tool);
	setWindowTitle(tr("Phonebook"));
	
	QVBoxLayout *layout 	= new QVBoxLayout;

	PhoneBookModell 	= new PBModell(this);
	connect(PhoneBookModell,SIGNAL(liste_geladen()), this, SLOT(Phonebook_loaded()));
	tabelle			= new QTableView(this);
	tabhead			= tabelle->horizontalHeader();

	tabelle->setModel(PhoneBookModell);
	tabelle->setSortingEnabled(true);
	connect(tabhead, SIGNAL(sectionClicked(int)), this, SLOT(ItemClicked(int)));
	layout->addWidget(tabelle);
	
// 	tabhead->setResizeMode(QHeaderView::ResizeToContents); 
	//tabhead->setClickable(true);
 
// 	closeButton = new QPushButton(tr("&Close"));
// 	connect(closeButton, SIGNAL(clicked()), this, SLOT(CloseWindow()));
// 	layout->addWidget(closeButton);

	setLayout(layout);

//  	fritzbox = new FritzBox("password");
	fritzbox = new FritzBox(parent,settings.value("common/password", "").toString());
	connect(fritzbox,SIGNAL(neues_telefonbuch(QString)),PhoneBookModell,SLOT(neue_liste(QString)));
// 	fritzbox->hole_telefonbuch();
}

void PhonebookWindow::CloseWindow(){
	close();	
	emit OnCloseWindow();
}

void PhonebookWindow::ItemClicked(int index){
	//Zur Ausgabe entweder mit std::endl oder flush()
	std::cout << "clicked : " <<std::endl;
	tabelle->sortByColumn(index);
	//PhoneBookModell->sort(1,Qt::AscendingOrder);
// 	//Ausgabe der Daten von der Fritzbox auf der Konsole
/*{ 	QFile file;
 	file.open(stderr, QIODevice::WriteOnly);
 	QTextStream output(&file);
  	output << "clicked\n" ;
 	
	file.close();
}*/
}
void PhonebookWindow::Phonebook_loaded()
{
	tabelle->resizeColumnsToContents();
	setEnabled(true);
}



