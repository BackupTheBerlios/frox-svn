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
	liste.push_back(Anruf());
	liste.push_back(Anruf());
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
	if (role == Qt::DisplayRole)
		return liste[index.row()][index.column()];
	return QVariant();
}

QVariant AnrufModell::headerData ( int section, Qt::Orientation orientation, int role ) const 
{
	if (role == Qt::DisplayRole && orientation == Qt::Horizontal)
		return Anruf::ueberschrift( section);
	return QVariant();
}
