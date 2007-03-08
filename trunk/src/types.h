//
// C++ Interface: types
//
// Description: 
//
//
// Author: Michael Wünscher <michael.wuenscher@gmx.de>, (C) 2007
//
// Copyright: See COPYING file that comes with this distribution
//
//
#ifndef TYPES_H
#define TYPES_H

#include <QtCore>

class Anruf{
	//TrCall(type, datum, name, rufnummer, port, route, routetype, dauer)
	//TrCall("1", "11.02.07 13:52", "", "03305680127", "4", "0", "1", "0:15"));
	int richtung;
	QDateTime datum;
	QString name;
	QString rufnr;
	int nebenstelle,anschluss,intern;
	QTime dauer;
public:
	Anruf();
	QVariant operator[](int index)const;
	static QString ueberschrift(int spalte);
	static int spaltenAnzahl(){return 8;}
};

class FBMessage{
	QDateTime marke;
	QString command;
	int id;
	
};
#endif /*TYPES_H*/
