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
#include <QtGui>
		
class Anruf{
	//TrCall(type, datum, name, rufnummer, port, route, routetype, dauer)
	//TrCall("1", "11.02.07 13:52", "", "03305680127", "4", "0", "1", "0:15"));
	int richtung;
	QDateTime datum;
	QString name;
	QString rufnr, nebenstelle,anschluss,intern;
	QTime dauer;
public:
	Anruf();
	Anruf(QStringList zeile);
	QVariant operator[](int index)const;
	static QString ueberschrift(int spalte);
	static int spaltenAnzahl(){return 8;}
};

class Person{
	QString name;
	QString rufnr;
	QString kurzwahl;
	QString vanity;
public:
	Person();
	Person(QStringList zeile);
	QVariant operator[](int index)const;
	static QString ueberschrift(int spalte);
	static int spaltenAnzahl(){return 4;}
};

class FBMessage{
public:
	FBMessage();
	FBMessage(const QString &nachricht);
	FBMessage(const FBMessage &input);
	QString toString();
	QString CmdtoString();
	bool isDisconnect(){return command == DISCONNECT;}
	void Disconnect(){command = UNSET;}
	enum eCommand {CALL,RING,DISCONNECT,CONNECT,UNSET};
	QDateTime marke;
	eCommand command;
	int id;
	QVector<QString> message;
};
#endif /*TYPES_H*/
