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
AnrufModell::AnrufModell(QWidget *parent)
:liste()
{
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
