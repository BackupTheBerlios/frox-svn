//
// C++ Implementation: modell
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#include "PBmodell.h"

void PBModell::neue_liste(QString daten){
	phonebook.clear();
	
	//Ausgabe der Daten von der Fritzbox auf der Konsole
	QFile file;
	file.open(stderr, QIODevice::WriteOnly);
	QTextStream output(&file);
 	output << daten;

  // <script type="text/javascript">document.write(TrFon("Karow", "0309432232", "06", ""));</script>

    //Einlesen der Daten und Schreiben der Liste
	QTextStream temp(&daten);
	do{
		QString zeile = temp.readLine();
		if (!zeile.isEmpty() && zeile.contains("document.write(TrFon(", Qt::CaseSensitive)){
			output << zeile << "\n";
			zeile.replace(1,55,"");
			zeile.chop(12);
 			phonebook.push_back(Person(zeile.split("\", "))); //push_back() ist gleich append() 
		}
	}while(!temp.atEnd());
	file.close();		

	//Änderung den Views bekanntgeben
	reset ();
	//std::cout << "Spalten "<<columnCount(index(0,0))<<" Zeilen "<< rowCount(index(0,0)) <<std::endl;
}

//Wird nur zum Editieren gebraucht
/*Qt::ItemFlags
AnrufModell::flags( const QModelIndex& index ) const
{
	if ( ! index.isValid() )
		return Qt::ItemIsEnabled;

	return QAbstractTableModel::flags(index) | Qt::ItemIsEditable;
}*/

PBModell::PBModell(QWidget *parent)
:phonebook()
{
	//liste.push_back(Anruf());
	//liste.push_back(Anruf());
}

int PBModell::rowCount(const QModelIndex &/*parent*/) const
{
	return phonebook.count();
}

int PBModell::columnCount(const QModelIndex &/*parent*/) const
{
	return Person::spaltenAnzahl();
}

QVariant PBModell::data ( const QModelIndex & index, int role ) const
{
	if (role == Qt::DisplayRole){
		return phonebook[index.row()][index.column()];
	}
	return QVariant();
}

QVariant PBModell::headerData ( int section, Qt::Orientation orientation, int role ) const 
{
	if (role == Qt::DisplayRole && orientation == Qt::Horizontal)
			return Person::ueberschrift(section);

	return QVariant();
}
