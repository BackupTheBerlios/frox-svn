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
#include "PBmodell.h"

void PBModell::neue_liste(QString daten){
	phonebook.clear();
	
	//Ausgabe der Daten von der Fritzbox auf der Konsole
// 	QFile file;
// 	file.open(stderr, QIODevice::WriteOnly);
// 	QTextStream output(&file);
//  	output << daten;

    //Einlesen der Daten und Schreiben der Liste
	QTextStream temp(&daten);
	do{
		QString zeile = temp.readLine();
		if (!zeile.isEmpty() && zeile.contains("document.write(TrFon(", Qt::CaseSensitive)){
// 			output << zeile << "\n";
			zeile.replace(1,55,"");
			zeile.chop(12);
 			phonebook.push_back(Person(zeile.split("\", "))); //push_back() ist gleich append() 
		}
	}while(!temp.atEnd());
	phonebook.push_back(Person());
	
// file.close();		

	//Änderung den Views bekanntgeben
	reset ();
	emit liste_geladen();
	//std::cout << "Spalten "<<columnCount(index(0,0))<<" Zeilen "<< rowCount(index(0,0)) <<std::endl;
}

bool PBModell::DataValid(int col, QVariant value) {
	int i=0;
	
	//doppelter Eintrag ? 
	if (value.toString() != "")
 		for (i=0;i<phonebook.count();i++) 
 			if (phonebook[i][col].toLower() == value.toString().toLower()) return false;
		
	switch (col) {
		case 0: //moegliche Fehler im Namen abfangen
			break;
		case 1: //moegliche Fehler in der Nummer abgfangen
			break;
		case 2: //moegliche Fehler in der Kurzwahl abfangen
			break;
		case 3: //moegliche Fehler im Vanity abfangen
			break;
	}
	return true;
}

//Wird nur zum Editieren gebraucht
Qt::ItemFlags PBModell::flags( const QModelIndex& index ) const
{
	if ( ! index.isValid() )
		return Qt::ItemIsEnabled;
	
	return QAbstractTableModel::flags(index) | Qt::ItemIsEditable;
}

bool PBModell::setData(const QModelIndex &index,const QVariant &value, int role)
{
     if (index.isValid() && role == Qt::EditRole) {
	if (DataValid(index.column(), value) == true)
		phonebook[index.row()][index.column()] = value.toString();	
//	
	//Ausgabe der Daten auf der Konsole
//  	QFile file;
//  	file.open(stderr, QIODevice::WriteOnly);
//  	QTextStream output(&file);
//  	output << "Ausgabe: " <<value.toString() << endl;//<<std::endl;
// 	file.close();

//       emit dataChanged(index, index);
	//Änderung den Views bekanntgeben //geht ansacheindend besser ohne, weil dann nicht mehr rumgescrollt wird
// 	reset ();
        return true;
     }
     return false;
 }
 
 void  PBModell::sort ( int column, Qt::SortOrder order ){
 	Person::order = order;
 	Person::sort_column = column;
// 	std::cout << "Sortiere" << std::endl;
 	qSort(phonebook);
 	emit layoutChanged();
 }
 
 QByteArray PBModell::upload_phonebook()
 {	
	QByteArray Data="";
	int i;
	
	for (i = 99;i>0;i--) 
		Data.append("telcfg:command/HotDialEntry"+QByteArray::number(i)+"=delete&");
	
	int count=0;
	for( i=0; i<phonebook.count(); i++){
 		if ((phonebook[i][0] != "<Neuer Eintrag>")&&(phonebook[i][0] != ""))
		{
			
			Data.append("telcfg:settings/HotDialEntry"+QString::number(count) +"/Code="  + phonebook[i][2]  + "&" +
				"telcfg:settings/HotDialEntry"+QString::number(count)+"/Vanity=" + phonebook[i][3] + "&" +
				"telcfg:settings/HotDialEntry"+QString::number(count)+"/Number=" + phonebook[i][1] + "&" +
				"telcfg:settings/HotDialEntry"+QString::number(count)+"/Name="   + phonebook[i][0] + "&");
			count++;
 		}
	}
	Data.append("Submit=Submit");

	return Data;
	 
 }

PBModell::PBModell(/*QWidget *parent*/)
:phonebook()
{
// Demoeinträge erzeugen
// 	for(int i=0;i<20;i++){
// 		phonebook.push_back(Person());
// 		phonebook[i][0] += QString("%1").arg(i); 
// 	}
}

int PBModell::rowCount(const QModelIndex &/*parent*/) const
{
	return phonebook.count();
}

int PBModell::columnCount(const QModelIndex &/*parent*/) const
{
	return Person::spaltenAnzahl();
}

QVariant PBModell::data ( const QModelIndex & index, int role ) const
{
	if (role == Qt::DisplayRole){
		return phonebook[index.row()][index.column()];
	}
	return QVariant();
}

QVariant PBModell::headerData ( int section, Qt::Orientation orientation, int role ) const 
{
	if (role == Qt::DisplayRole && orientation == Qt::Horizontal)
			return Person::ueberschrift(section);

	return QVariant();
}

QString PBModell::NameFromNumber(QString number){
	int i = 0;
	QString CallersName="";
	
	for (i=0;i< phonebook.count();i++){
		if (phonebook[i][1] == number) {
			CallersName = phonebook[i][0];
		 	break;
		}
	}
	
	if ( CallersName.startsWith("!")==true) CallersName.remove(0,1); //Ausrufezeichen abschneiden
	
	if (CallersName != "") return CallersName;
	else
	return number;
	
}

void PBModell::SaveToFile(QString FileName){
	
	QFile file(FileName);
     	if (!file.open(QIODevice::WriteOnly | QIODevice::Text))
        	 return;

     	QTextStream out(&file);

	int i=0;
	for (i=0;i< phonebook.count(); i++){
		if ((phonebook[i][0] != "") && (phonebook[i][0]!= "<Neuer Eintrag>"))
			out 	<< phonebook[i][0] << "\t" 
			 	<< phonebook[i][1] << "\t" 
			 	<< phonebook[i][2] << "\t" 
			 	<< phonebook[i][3] << "\n";
	}
	file.close();
}

void PBModell::LoadFromFile(QString FileName){

	QFile file(FileName);
	if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
	 return;

    //Einlesen der Daten und Schreiben der Liste
	
	do{
		QString zeile = file.readLine();
		if (!zeile.isEmpty()){
			phonebook.push_back(Person(zeile.split("\t"))); //push_back() ist gleich append() 
		}
	}while(!file.atEnd());
	phonebook.push_back(Person());
	file.close();
	
	emit liste_geladen();
}

void PBModell::DoImport(QString sep, int N_Name, int N_Number, int N_Short, int N_Vanity, QStringList Lines){
int i=0;
QStringList zeile, zeile_sort;

for (i=0; i<Lines.count(); i++)
 if (!Lines[i].isEmpty()){
 			zeile.clear();
 			zeile_sort.clear();
			zeile = Lines[i].split(sep);
			
			zeile_sort.append(zeile[N_Name-1]);
			zeile_sort.append(zeile[N_Number-1]);
			zeile_sort.append(zeile[N_Short-1]);
			zeile_sort.append(zeile[N_Vanity-1]);
			
			phonebook.push_back(zeile_sort); //an das Telefonbuch anfügen
		}
		
	//Änderung den Views bekanntgeben
	reset ();	
	emit liste_geladen();
 }
