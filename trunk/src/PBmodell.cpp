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
// 	QFile file;
// 	file.open(stderr, QIODevice::WriteOnly);
// 	QTextStream output(&file);
//  	output << daten;

    //Einlesen der Daten und Schreiben der Liste
	QTextStream temp(&daten);
	do{
		QString zeile = temp.readLine();
		if (!zeile.isEmpty() && zeile.contains("document.write(TrFon(", Qt::CaseSensitive)){
// 			output << zeile << "\n";
			zeile.replace(1,55,"");
			zeile.chop(12);
 			phonebook.push_back(Person(zeile.split("\", "))); //push_back() ist gleich append() 
		}
	}while(!temp.atEnd());
	
// file.close();		

	//Änderung den Views bekanntgeben
	reset ();
	emit liste_geladen();
	//std::cout << "Spalten "<<columnCount(index(0,0))<<" Zeilen "<< rowCount(index(0,0)) <<std::endl;
}

//Wird nur zum Editieren gebraucht
Qt::ItemFlags PBModell::flags( const QModelIndex& index ) const
{
	if ( ! index.isValid() )
		return Qt::ItemIsEnabled;

	return QAbstractTableModel::flags(index) | Qt::ItemIsEditable;
}
bool PBModell::setData(const QModelIndex &index,const QVariant &value, int role)
{
     if (index.isValid() && role == Qt::EditRole) {
			
	//Ausgabe der Daten auf der Konsole
 			QFile file;
 			file.open(stderr, QIODevice::WriteOnly);
 			QTextStream output(&file);
 			
 			output << "Ausgabe: " <<value.toString() << endl;//<<std::endl;
 			phonebook[index.row()][index.column()] = value.toString();
			file.close();
		

//   		 phonebook[index.row()][0] = value.toString;
//          phonebook.replace(index.row(), value.toString());
         emit dataChanged(index, index);
		//Änderung den Views bekanntgeben
		reset ();
         return true;
     }
     return false;
 }
 
 void  PBModell::sort ( int column, Qt::SortOrder order ){
 	Person::order = order;
 	Person::sort_column = column;
// 	std::cout << "Sortiere" << std::endl;
 	qSort(phonebook);
 	emit layoutChanged();
 }

PBModell::PBModell(QWidget *parent)
:phonebook()
{
	for(int i=0;i<20;i++){
		phonebook.push_back(Person());
		phonebook[i][0] += QString("%1").arg(i); 
	}
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



