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
#include <iostream>
Anruf::Anruf()
:richtung(-1),datum(),name("name"),rufnr("unbekannt"),
nebenstelle(""),anschluss(""),intern(""),dauer()
{}

Anruf::Anruf(QStringList zeile)
:richtung(-1),datum(),name("name"),rufnr("unbekannt"),
nebenstelle(""),anschluss(""),intern(""),dauer()
{
	if (spaltenAnzahl()-1==zeile.count()){
		richtung = zeile.takeFirst().toInt();
		datum = QDateTime::fromString(zeile.takeFirst(),"dd.MM.yy hh:mm").addYears(100);
		name = zeile.takeFirst();
		rufnr = zeile.takeFirst();
		nebenstelle= zeile.takeFirst();
		QStringList anschluss_intern= zeile.takeFirst().split(':');
		anschluss = anschluss_intern.takeFirst();
		intern = anschluss_intern.takeFirst();
		dauer = QTime::fromString(zeile.takeFirst(),"m:ss");
	}
}

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

//FBMessage

FBMessage::FBMessage()
	:command(UNSET)
{
}

FBMessage::FBMessage(const FBMessage &input)
:marke(input.marke),command(input.command),id(input.id),message(input.message)
{
}

FBMessage::FBMessage(const QString &nachricht)
{
	QList<QString> tempstlst(nachricht.split(';'));
	//09.03.07 08:51:10
	marke = QDateTime::fromString(tempstlst.first(),"dd.MM.yy hh:mm:ss").addYears(100);
	tempstlst.removeFirst();
	
	switch (tempstlst.first().at(0).toAscii ()){
		case 'C':
			if (tempstlst.first().at(1).toAscii () == 'A'){
				command = CALL;
			}else{
				command = CONNECT;
			}
			tempstlst.removeFirst();
			break;
		case 'R':
			command = RING;
			tempstlst.removeFirst();
			break;
		case 'D':
			command = DISCONNECT;
			tempstlst.removeFirst();
			break;
		default:
			command = UNSET;
			tempstlst.removeFirst();
	}
	//Holen der id
	id = tempstlst.first().toInt();
	tempstlst.removeFirst();
	//der rest
	message = QVector<QString>::fromList(tempstlst);
	
}

QString FBMessage::CmdtoString(){
	switch (command){
		case CALL:
			return QString("Anruf");
		case RING:
			return QString("Klingeln");
		case DISCONNECT:
			return QString("Beendet");
		case CONNECT:
			return QString("Verbunden");
		default:
			return QString("unset");
	}
}

QString FBMessage::toString(){
	if (command == UNSET){
		return CmdtoString();
	}
	return marke.toString()+" "+CmdtoString()+ QString(" %1").arg(id);
}
