#include <QtGui>

#include "phonebook.h"

//der Konstruktor
PhonebookWindow::PhonebookWindow(QWidget *parent, QString password)
	: QWidget(parent),tabhead(NULL)
{
	setWindowFlags(Qt::Tool);
	setWindowTitle(tr("Phonebook"));
	
	QVBoxLayout *layout = new QVBoxLayout;

	PhoneBookModell 	= new PBModell(this);
	tabelle				= new QTableView(this);
	tabhead				= tabelle->horizontalHeader();
	tableWid			= new QTableWidget(3,4,this);

	tabelle->setModel(PhoneBookModell);
	tabelle->resizeColumnsToContents();
	tabelle->setSortingEnabled(true);
	tabhead->setResizeMode(QHeaderView::ResizeToContents); 
	tabhead->setClickable(true);

// 	connect(tabhead, SIGNAL(sectionClicked(int)), tabelle, SLOT(sortByColumn(int,Qt::SortOrder)));
	connect(tabhead, SIGNAL(sectionClicked(int)), this, SLOT(ItemClicked(int)));

// 	connect(tabelle, SIGNAL(clicked(QModelIndex)), this, SLOT(ItemClicked(QModelIndex)));
// 	connect(tabelle, SIGNAL(clicked(int)), this, SLOT(std::cout << "clicked"));
	layout->addWidget(tabelle);
	layout->addWidget(tableWid);

	closeButton = new QPushButton(tr("&Close"));
	connect(closeButton, SIGNAL(clicked()), this, SLOT(CloseWindow()));
	layout->addWidget(closeButton);

	setLayout(layout);

//  	fritzbox = new FritzBox("password");
	fritzbox = new FritzBox(password);
	connect(fritzbox,SIGNAL(neues_telefonbuch(QString)),PhoneBookModell,SLOT(neue_liste(QString)));
	fritzbox->hole_telefonbuch();
}

void PhonebookWindow::CloseWindow(){
	close();	
	emit OnCloseWindow();
	delete this;
}

void PhonebookWindow::ItemClicked(int index){
// 	std::cout << "clicked : " ;
	tabelle->sortByColumn(index, Qt::AscendingOrder);
	PhoneBookModell->sort(1,Qt::AscendingOrder);
// 	//Ausgabe der Daten von der Fritzbox auf der Konsole
{ 	QFile file;
 	file.open(stderr, QIODevice::WriteOnly);
 	QTextStream output(&file);
  	output << "clicked\n" ;
	file.close();
}
}


