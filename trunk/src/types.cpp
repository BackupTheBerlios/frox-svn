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
		case 3:
			return rufnr;
		case 4:
			return nebenstelle;
		case 5:
			return anschluss;
		case 6:
			return intern;
		case 7:
			return dauer;
		default: 
			return QString("unbekannt");
	}
}

QString Anruf::ueberschrift(int spalte)
{
	switch (spalte){
		case 0:
			return QString("Type");
		case 1:
			return QString("Datum");
		case 2:
			return QString("Name");
		case 3:
			return QString("Nummer");
		case 4:
			return QString("Telefon");
		case 5:
			return QString("Anschluss");
		case 6:
			return QString("Ex.RufNr.");
		case 7:
			return QString("Dauer");
		default:
			return QString("unbekannt");
	}
}

//Person (Telefonbuch)

Qt::SortOrder Person::order = Qt::AscendingOrder;
int Person::sort_column =0;

Person::Person()
:name("Neu"),rufnr(""),kurzwahl(""),vanity("")
{}

Person::Person(QStringList zeile)
:name("name"),rufnr("unbekannt"),kurzwahl(-1),vanity("")
{
 	if (spaltenAnzahl() == zeile.count()){
		name		= zeile.takeFirst().trimmed();
		rufnr		= zeile.takeFirst().trimmed();
		kurzwahl	= zeile.takeFirst().trimmed();
		vanity		= zeile.takeFirst().trimmed();	

		name.remove("\"");
		name.replace("&auml;","ä");
		name.replace("&ouml;","ö");
		name.replace("&uuml;","ü");
		name.replace("&Auml;","Ä");
		name.replace("&Ouml;","Ö");
		name.replace("&Uuml;","Ü");
		name.replace("&szlig;","ß");

		rufnr.remove("\"");
		kurzwahl.remove("\"");
		vanity.remove("\"");
 	}
}

/*QVariant Person::operator[](int index) const
{
	switch (index){
		case 0:
			return name;
		case 1:
			return rufnr;
		case 2:
			return kurzwahl;
		case 3:
			return vanity;
		default: 
			return QString("unbekannt");
	}
}*/

QString &  Person::operator[](int index){
	switch (index){
		case 0:
			return name;
		case 1:
			return rufnr;
		case 2:
			return kurzwahl;
		case 3:
			return vanity;
	/*	default: 
			return QString("unbekannt");*/
	}
}

const QString &  Person::operator[](int index)const {
	switch (index){
		case 0:
			return name;
		case 1:
			return rufnr;
		case 2:
			return kurzwahl;
		case 3:
			return vanity;
	/*	default: 
			return QString("unbekannt");*/
	}
}

QString Person::ueberschrift(int spalte)
{
	switch (spalte){
		case 0:
			return QString("Name");
		case 1:
			return QString("Nummer");
		case 2:
			return QString("Kurzwahl");
		case 3:
			return QString("Vanity");
		default:
			return QString("unbekannt");
	}
}

bool operator<(const Person & lvalue,const Person & rvalue){
//	std::cout << "sortiere"<<lvalue[Person::sort_column].toStdString() <<" "<< rvalue[Person::sort_column].toStdString()<<std::endl;
	if (Person::order == Qt::AscendingOrder){
		return lvalue[Person::sort_column] < rvalue[Person::sort_column];
	}else{
		return !(lvalue[Person::sort_column] < rvalue[Person::sort_column]);
	}
}



//FBMessage
FBMessage::FBMessage()
	:command(UNSET)
{
}

FBMessage::FBMessage(const FBMessage &input)
:marke(input.marke),command(input.command),id(input.id)
		//message(input.message)
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
	
	if (command == RING) {
		incoming	= true;
		Nebenstelle	= "";
		Rufnummer	= tempstlst.at(0);
		MSN		= tempstlst.at(1);
		Dauer		= 0;
	}
	else
	if (command == CALL) {
		incoming	= false;
		Nebenstelle	= tempstlst.at(0);
		MSN		= tempstlst.at(1);
		Rufnummer	= tempstlst.at(2);
		Dauer		= 0;
		}
	else
	if (command == CONNECT) {
		Nebenstelle	= tempstlst.at(0);
		MSN		= "";
		Rufnummer	= tempstlst.at(1);
		Dauer		= 0;
		}
	else
	if (command == DISCONNECT) {
			Nebenstelle	= "";
			MSN		= "";
			Rufnummer	= "";
			Dauer		= tempstlst.at(0).toInt();
		}
		
	
	//der rest
// 	message = QVector<QString>::fromList(tempstlst);
	
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
