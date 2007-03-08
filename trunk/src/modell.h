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
#ifndef MODELL_H
#define MODELL_H

#include <QtCore>
#include "types.h"

class AnrufModell:public QAbstractTableModel{
	Q_OBJECT
private:
	QList<Anruf> liste;
	QString header;
public:
	AnrufModell(QWidget *parent);
	int rowCount(const QModelIndex &/*parent*/) const;
	int columnCount(const QModelIndex &/*parent*/) const;
	QVariant data ( const QModelIndex & index, int role = Qt::DisplayRole ) const;
	QVariant headerData ( int section, Qt::Orientation orientation, int role = Qt::DisplayRole ) const ;
};

#endif /*MODELL_H*/
