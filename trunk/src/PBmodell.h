//
// C++ Interface: modell
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#ifndef PBMODELL_H
#define PBMODELL_H

#include <QtCore>
#include <QModelIndex>
#include <iostream>
#include "types.h"

class PBModell:public QAbstractTableModel{
	Q_OBJECT
private:
	QList<Person> phonebook;
	QString header;
	
public	slots:
	 void neue_liste(QString daten);
	signals:
	 void liste_geladen();

public:
	PBModell(QWidget *parent);
	
	//zum Editieren
	Qt::ItemFlags flags( const QModelIndex& index ) const;
	bool setData(const QModelIndex &index,const QVariant &value, int role);
	
	void sort ( int column, Qt::SortOrder order = Qt::AscendingOrder );
	QByteArray upload_phonebook();

	int rowCount(const QModelIndex &/*parent*/) const;
	int columnCount(const QModelIndex &/*parent*/) const;
	QVariant data ( const QModelIndex & index, int role = Qt::DisplayRole ) const;
	QVariant headerData ( int section, Qt::Orientation orientation, int role = Qt::DisplayRole ) const ;	
};

#endif /*MODELL_H*/