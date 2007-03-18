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
#include "modell.h"

void AnrufModell::neue_liste(QString daten, QChar seperator ){
	liste.clear();
	
	//Ausgabe der Daten von der Fritzbox auf der Konsole
	QFile file;
	file.open(stderr, QIODevice::WriteOnly);
	QTextStream output(&file);
	output << daten;
	file.close();

    //Einlesen der Daten und Schreiben der Liste
	QTextStream temp(&daten);
	do{
		QString zeile = temp.readLine();
		if (!zeile.isEmpty())
			liste.push_back(Anruf(zeile.split(seperator)));
	}while(!temp.atEnd());
	
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

AnrufModell::AnrufModell(QWidget *parent)
:liste()
{
	//liste.push_back(Anruf());
	//liste.push_back(Anruf());
}

int AnrufModell::rowCount(const QModelIndex &/*parent*/) const
{
	return liste.count();
}

int AnrufModell::columnCount(const QModelIndex &/*parent*/) const
{
	return Anruf::spaltenAnzahl();
}

QVariant AnrufModell::data ( const QModelIndex & index, int role ) const
{
	if (role == Qt::DisplayRole && index.column() !=0)
		return liste[index.row()][index.column()];
	if (role == Qt::DecorationRole && index.column() == 0){
		switch(liste[index.row()][index.column()].toInt()){
			case 1:
				//Angenommen
				return QIcon("bilder/Callin.gif");
			case 2:
				//Abwesend
				return QIcon("bilder/Callinfailed.gif");
			case 3:
				//Ausgehend
				return QIcon("bilder/Callout.gif");
			default:
				break;
		}
	}
	if (role == Qt::SizeHintRole && index.column() == 0){
		return QSize(20,0);
	}
	return QVariant();
}

QVariant AnrufModell::headerData ( int section, Qt::Orientation orientation, int role ) const 
{
	if (role == Qt::SizeHintRole && orientation == Qt::Horizontal && section == 0){
		return QSize(20,0);
	}
	if (role == Qt::DisplayRole && orientation == Qt::Horizontal)
		if (section !=0)
			return Anruf::ueberschrift( section);
	return QVariant();
}
