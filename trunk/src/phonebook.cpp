#include <QtGui>

#include "phonebook.h"

//der Konstruktor
PhonebookWindow::PhonebookWindow(QWidget *parent, QString password)
	: QWidget(parent)
{
	setWindowFlags(Qt::Tool);
	setWindowTitle(tr("Phonebook"));
	
	QVBoxLayout *layout = new QVBoxLayout;

	PhoneBookModell 	= new PBModell(this);
	tabelle				= new QTableView(this);

	tabelle->setModel(PhoneBookModell);
	tabelle->resizeColumnsToContents();
	tabelle->setSortingEnabled(true);
	tabelle->horizontalHeader()->setResizeMode(QHeaderView::ResizeToContents); 
	tabelle->horizontalHeader()->setClickable(true);

	connect(tabelle, SIGNAL(clicked(QModelIndex)), this, SLOT(ItemClicked(QModelIndex)));
// 	connect(tabelle, SIGNAL(clicked(int)), this, SLOT(std::cout << "clicked"));
	layout->addWidget(tabelle);

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

void PhonebookWindow::ItemClicked(const QModelIndex index){
	std::cout << "clicked : " ;
	
}


