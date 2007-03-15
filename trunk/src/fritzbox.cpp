#include "fritzbox.h"
//%2Fhtml%2Fde%2FFRITZ%21Box_Anrufliste.csv&var%3Alang=de&login%3Acommand%2Fpassword=
const QByteArray FritzBox::POSTDATA_CSV = "getpage=..%2Fhtml%2Fde%2FFRITZ%21Box_Anrufliste.csv";
const QByteArray FritzBox::POSTDATA_LOGIN = "&login%3Acommand%2Fpassword=";
const QByteArray FritzBox::POSTDATA_PHONE_BOOK = "getpage=..%2Fhtml%2Fde%2Ffon%2FppFonbuch.html&var%3Alang=de";
const QByteArray FritzBox::POSTDATA_CALL_LIST = "getpage=..%2Fhtml%2Fde%2Fmenus%2Fmenu2.html&var%3Alang=de&var%3Amenu=fon&var%3Apagename=foncalls";
const QByteArray FritzBox::POSTDATA_CALL_LIST_ALL = "getpage=..%2Fhtml%2Fde%2Fmenus%2Fmenu2.html&var%3Alang=de&var%3Amenu=fon&var%3Apagename=foncalls&var%3Ashowall";

FritzBox::FritzBox(const QString &_passwort,const QString &_host,int _port)
:host(_host),passwort(_passwort),port(_port),postheader("POST", "/cgi-bin/webcm")
{
	//QString host();
	http = new QHttp(host,port);
  	
  	postheader.setValue("Host", "fritz.box"); 
  	postheader.setContentType("application/x-www-form-urlencoded");
  	
	connect(http,SIGNAL(done(bool)),this,SLOT(Seite_geladen(bool)));
}
	
FritzBox::~FritzBox(){
	delete http;
}

void FritzBox::Seite_geladen(bool error){
	//reagiert nur auf die letzte Anfrage!!
	if (error){
		QMessageBox::critical( NULL, tr("Fritz Box Fehler"), http->errorString ());
	}else{
		//QFile temp("test.html");
		/*temp.open(QIODevice::WriteOnly);
		if (temp.isWritable ()){
				temp.write();
		}*/
		QHttpResponseHeader antwort = http->lastResponse();
		std::cout <<"geladen "<< antwort.toString().toStdString()<<std::endl;
		QByteArray daten(http->readAll());
		std::cout << "Inhalt: "<< daten.data()<<std::endl;
		
		if (antwort.value("content-disposition").contains("FRITZ!Box_Anrufliste.csv"))
			verarbeite_csv(daten);
		
	}
}

void FritzBox::holeSeite(const QByteArray &postdaten){

	if (!passwort.isEmpty())
		http->request(postheader,postdaten + POSTDATA_LOGIN + QUrl::toPercentEncoding(passwort));
	else
  		http->request(postheader, postdaten);
}

void FritzBox::verarbeite_csv(QByteArray &daten){
	QTextStream input(&daten);
	//Seperator
	QChar seperator(';');
	QStringList erstezeile(input.readLine().split("sep=",QString::SkipEmptyParts));
	if (!erstezeile.isEmpty()){
		seperator = erstezeile.first().at(0);
	}
	
	//Kopfzeile löschen
	input.readLine();
	
	emit neue_anrufliste(input.readAll(),seperator);
}

void FritzBox::hole_anrufliste(){
	http->clearPendingRequests();
	holeSeite(POSTDATA_CALL_LIST);
	holeSeite(POSTDATA_CSV);
}

void FritzBox::hole_telefonbuch(){
	http->clearPendingRequests();
	holeSeite(POSTDATA_PHONE_BOOK);
}
