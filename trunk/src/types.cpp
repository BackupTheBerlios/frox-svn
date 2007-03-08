//
// C++ Implementation: types
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#include "types.h"
Anruf::Anruf()
:richtung(-1),datum(),name("name"),rufnr("unbekannt"),
nebenstelle(-2),anschluss(-3),intern(-4),dauer()
{}

QVariant Anruf::operator[](int index) const
{
	switch (index){
		case 0:
			return richtung;
		case 1:
			return datum;
		case 2:
			return name;
		default: 
			return QString("unbekannt");
	}
}

QString Anruf::ueberschrift(int spalte)
{
	switch (spalte){
		case 0:
			return QString("");
		case 1:
			return QString("Datum");
		case 2:
			return QString("Name");
		default:
			return QString("unbekannt");
	}
}
