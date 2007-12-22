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
	
// Debug start
	//Ausgabe der Daten von der Fritzbox auf der Konsole
	QFile file;
	file.open(stderr, QIODevice::WriteOnly);
	QTextStream output(&file);
//  	output << daten;
// Debug end
    //Einlesen der Daten und Schreiben der Liste
	QTextStream temp(&daten);
	QString name = "";
	QStringList empty;
	empty.append("");	empty.append("");	empty.append("");	empty.append("");	empty.append("");	empty.append("");
	QStringList pb = empty;
	bool important = FALSE;
	do{
		QStringList tmp;
		QString zeile = temp.readLine();
		
		//Neuer Name gefunden 
		if (!zeile.isEmpty() && zeile.contains("<script type=\"text/javascript\">TrFonName(", Qt::CaseSensitive)){
			
			if ((pb.at(1) != "") || (pb.at(2) != "") || (pb.at(3) != ""))
				phonebook.push_back(Person(pb)); //push_back() ist gleich append() 
			pb = empty;
			//output << zeile << "\n"; //gesamte Zeile ausgeben
			zeile.replace(0,41,"");
			zeile.chop(11);				//geparste Zeile ausgeben
			//output << zeile << "\n";
			
			tmp = zeile.split("\", \"");
			
			important = (tmp.at(2) == "1\"");
			if (important == TRUE)
				pb.replace(0, "!"+tmp.at(1));
			else
				pb.replace(0, tmp.at(1));
		}
		else 
		//neue nummer zu obigem Namen gefunden
		if (!zeile.isEmpty() && zeile.contains("<script type=\"text/javascript\">TrFonNr(", Qt::CaseSensitive)){
			QStringList t;	
			//output << zeile << "\n"; 	//gesamte Zeile ausgeben
			zeile.replace(0,39,"");
			zeile.chop(11);
			//output << zeile << "\n";	//geparste Zeile ausgeben
			t = zeile.split("\", \"");
			
			if (t.at(0) == "\"home")
				pb.replace(1,t.at(1));
			else
			if (t.at(0) == "\"mobile")
				pb.replace(2,t.at(1));
			else
			if (t.at(0) == "\"work")
				pb.replace(3,t.at(1));
			
			if (t.at(2) != "") pb.replace(4,t.at(2));
			if (t.at(3) != "\"") pb.replace(5,t.at(3));

		}
	}while(!temp.atEnd());

	if ((pb.at(1) != "")||(pb.at(2) != "")||(pb.at(3) != "")) //den letzten Datensatz anhaengen
				phonebook.push_back(Person(pb)); //push_back() ist gleich append() 
	phonebook.push_back(Person());
	
// file.close();		

	//Änderung den Views bekanntgeben
	reset ();
	emit liste_geladen();
	//std::cout << "Spalten "<<columnCount(index(0,0))<<" Zeilen "<< rowCount(index(0,0)) <<std::endl;
}

bool PBModell::DataValid(int col, QVariant value){
	int i=0;
		
	switch (col) {
		case 0	: //moegliche Fehler im Namen abfangen
			if (value.toString() == tr("<Neuer Eintrag>")) 
				for (i=0;i<phonebook.count();i++) 
 					if (phonebook[i][col].toLower() == value.toString().toLower()) return false;
			break;
// 		case 1,2,3
		default	: //moegliche Fehler in der Nummer abgfangen
			if (value.toString() != "") //doppelter Eintrag ? 
 				for (i=0;i<phonebook.count();i++) 
 					if (phonebook[i][col].toLower() == value.toString().toLower()) return false;
			break;
// 		case 2: //moegliche Fehler in der Kurzwahl abfangen
// 			break;
// 		case 3: //moegliche Fehler im Vanity abfangen
// 			break;
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
	
		if (DataValid(0,tr("<Neuer Eintrag>"))) {
				phonebook.push_back(Person());
				//Änderung den Views bekanntgeben //geht ansacheindend besser ohne, weil dann nicht mehr rumgescrollt wird
				reset ();
			}
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
	
	
	//for (i = 99;i>0;i--) 
	for (i = 0;i<100;i++) 
		Data.append("telcfg:command/Phonebook/Entry"+QByteArray::number(i)+"=delete"+"&");
	
	Data.append("Submit=Submit");
	std::cout << "Data" << std::endl;
	return Data;
	
	
	int count=0;
	for( i=0; i<phonebook.count(); i++){
// 		Einträge die ausgelassen mit den Merkmalen:
// 		- Name ist '<Neuer Eintrag>'
// 		- Nummer ist leer
// 		- Kurzwahl ist leer
		if ((phonebook[i][0] != tr("<Neuer Eintrag>"))&&(phonebook[i][0] != "")&& (phonebook[i][4]!=""))
		{
		QString no = QString::number(count);	
//POST Example		
//getpage = ../html/de/menus/menu2.html
//errorpage = ../html/de/menus/menu2.html
//var:lang = devar:pagename = fonbuch
//var:errorpagename = fonbuch2
//var:menu = home
//var:pagemaster = fonbuch
//time:settings/time = 1198187178,-60
//var:showall =
//var:showStartIndex =
//var:PhonebookEntryNew = Entry0
//var:PhonebookEntryXCount = 0
//var:PhonebookEntryNewCode = 01
//var:PhonebookEntryNumber =
//telcfg:settings/Phonebook/Entry0/Name = TESTERT TESTEREI
//telcfg:settings/Phonebook/Entry0/Category = 1
//telcfg:settings/Phonebook/Entry0/Number0/Type = home
//telcfg:settings/Phonebook/Entry0/Number0/Number = 12345678
//telcfg:settings/Phonebook/Entry0/Number0/Code = 01
//telcfg:settings/Phonebook/Entry0/Number0/Vanity =
//telcfg:settings/Phonebook/Entry0/Number1/Type = mobile
//telcfg:settings/Phonebook/Entry0/Number1/Number = 87654321
//telcfg:settings/Phonebook/Entry0/Number1/Code =
//telcfg:settings/Phonebook/Entry0/Number1/Vanity =
//telcfg:settings/Phonebook/Entry0/Number2/Type = work
//telcfg:settings/Phonebook/Entry0/Number2/Number =
//telcfg:settings/Phonebook/Entry0/Number2/Code =
//telcfg:settings/Phonebook/Entry0/Number2/Vanity =
//telcfg:settings/Phonebook/Entry0/DefaultNumber = 0 
			
			Data.append("telcfg:settings/Phonebook/Entry"+no +"/Name="  + phonebook[i][0]  + "&" +
			 	"telcfg:settings/Phonebook/Entry"+no+"/Category=1&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number0/Type=home&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number0/Number=" + phonebook[i][1] + "&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number0/Code="   + phonebook[i][4] + "&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number0/Vanity=" + phonebook[i][5] + "&"+
				"telcfg:settings/Phonebook/Entry"+no+"/Number1/Type=mobile&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number1/Number=" + phonebook[i][2] + "&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number1/Code="  + "&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number1/Vanity="  + "&"+
				"telcfg:settings/Phonebook/Entry"+no+"/Number2/Type=work&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number2/Number=" + phonebook[i][3] + "&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number2/Code="  + "&" +
				"telcfg:settings/Phonebook/Entry"+no+"/Number2/Vanity="  + "&"+
				"telcfg:settings/Phonebook/Entry"+no+"/DefaultNumber=0" + "&");
			
			//Data.append("telcfg:settings/HotDialEntry"+QString::number(count) +"/Code="  + phonebook[i][2]  + "&" +
				//"telcfg:settings/HotDialEntry"+QString::number(count)+"/Vanity=" + phonebook[i][3] + "&" +
				//"telcfg:settings/HotDialEntry"+QString::number(count)+"/Number=" + phonebook[i][1] + "&" +
				//"telcfg:settings/HotDialEntry"+QString::number(count)+"/Name="   + phonebook[i][0] + "&");
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
		if ((phonebook[i][0] != "") && (phonebook[i][0]!= tr("<Neuer Eintrag>")))
			out << phonebook[i][0] << "\t" 
			 	<< phonebook[i][1] << "\t" 
			 	<< phonebook[i][2] << "\t" 
			 	<< phonebook[i][3] << "\t" 
			 	<< phonebook[i][4] << "\t" 
			 	<< phonebook[i][5] << "\n";
	}
	file.close();
}

void PBModell::LoadFromFile(QString FileName){

	QFile file(FileName);
	if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
	 return;

    //Einlesen der Daten und Schreiben der Liste
	
	do{
		//QString zeile = QString::fromLocal8Bit(file.readLine());
		QString zeile = file.readLine();
		if (!zeile.isEmpty())
			phonebook.push_back(Person(zeile.split("\t"))); //push_back() ist gleich append() 
		
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
			
			if ( N_Name == -1 ) 
				zeile_sort.append(tr("<unbekannt>"));
			else zeile_sort.append(zeile[N_Name-1]);
			
			zeile_sort.append(zeile[N_Number-1]);
			
			if ( N_Short == -1 ) { 
					zeile_sort.append(GenerateFreeShortDial());
				}
			else zeile_sort.append(zeile[N_Short-1]);
				
			if (N_Vanity == -1){
					zeile_sort.append(GenerateFreeVanity());
				}
			else zeile_sort.append(zeile[N_Vanity-1]);
			
			phonebook.push_back(zeile_sort); //an das Telefonbuch anfügen
		}
		
	//Änderung den Views bekanntgeben
	reset ();	
	emit liste_geladen();
 }
 
QString PBModell::GenerateFreeShortDial(){

	int i = 0;
	QStringList ShortDial;
	
	for (i=0; i< 100; i++){
		if (i < 10)
			ShortDial.append("0" + QString::number(i,10));
		else	
			ShortDial.append(QString::number(i,10));
	}
	
	for (i=0; i< phonebook.count(); i++)
		ShortDial.removeAt(ShortDial.indexOf(phonebook[i][2]));
	
	if (ShortDial.count() > 0)
		return ShortDial[0];
	else 
		return "keine freie Kurzwahl";

}

QString PBModell::GenerateFreeVanity(){
	return "";
}

