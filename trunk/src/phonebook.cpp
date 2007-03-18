#include <QtGui>

#include "phonebook.h"

//der Konstruktor
PhonebookWindow::PhonebookWindow(QWidget *parent)
	: QWidget(parent)
{
	setWindowFlags(Qt::Tool);
	setWindowTitle(tr("Phonebook"));
	
	QVBoxLayout *layout = new QVBoxLayout;

	PhoneBookModell 	= new PBModell(this);
	tabelle				= new QTableView(this);

	tabelle->setModel(PhoneBookModell);
	tabelle->resizeColumnsToContents();

	layout->addWidget(tabelle);

	closeButton = new QPushButton(tr("&Close"));
	connect(closeButton, SIGNAL(clicked()), this, SLOT(close()));
	layout->addWidget(closeButton);

	setLayout(layout);

 	fritzbox = new FritzBox("password");
 	connect(fritzbox,SIGNAL(neues_telefonbuch(QString)),PhoneBookModell,SLOT(neue_liste(QString)));
	fritzbox->hole_telefonbuch();
}

