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
 		{ 	QFile file;
 			QString dat;
			QString Str;
 			dat = value.toString();
  			file.open(stderr, QIODevice::WriteOnly);
  			QTextStream output(&file);
			Str = "edit: ";
			Str += value.toString();

  			output << "edit :";// << dat.toStdString() << "\n";
// warum geht das nicht ?
// 			output << Str.toStdString();
// 	value.toString.toStdString();
			file.close();
			}

//   		 phonebook[index.row()][0] = value.toString;
//          phonebook.replace(index.row(), value.toString());
         emit dataChanged(index, index);
		//Änderung den Views bekanntgeben
		reset ();
         return true;
     }
     return false;
 }

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



