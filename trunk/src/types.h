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
	QStringList text;
// 	QDateTime datum;
// 	QString name;
// 	QString rufnr, nebenstelle,anschluss,intern;
// 	QTime dauer;
public:
	Anruf();
	Anruf(QStringList zeile);
	QVariant operator[](int index)const;
	static QString ueberschrift(int spalte);
	static int spaltenAnzahl(){return 8;}
};

class Person{
	QString name;
	QString home;
	QString mobile;
	QString work;
	QString kurzwahl;
	QString vanity;
public:
	static Qt::SortOrder order;
	static int sort_column;
	Person();
	Person(QStringList zeile);
	//QVariant operator[](int index)const;
	QString & operator[](int index);
	const QString & operator[](int index)const;
	static QString ueberschrift(int spalte);
	static int spaltenAnzahl(){return 6;}
	
	friend bool operator<(const Person & lvalue,const Person & rvalue);
};

class FBMessage{
public:
	FBMessage();
	FBMessage(const QString &nachricht);
	FBMessage(const FBMessage &input);
	QString toString();
	QString CmdtoString();
	bool CallTerminated(){return command == DISCONNECT;}
	bool CallStarted(){return command == CONNECT;}
	void Disconnect(){command = UNSET;}
	
	enum eCommand {CALL, RING, DISCONNECT,CONNECT, UNSET};
	QDateTime marke;
	eCommand command;
	bool incoming;
	int id;
	QString Rufnummer;
	QString MSN;
	QString Nebenstelle;
	int Dauer;
	
// 	QVector<QString> message;
};
#endif /*TYPES_H*/
