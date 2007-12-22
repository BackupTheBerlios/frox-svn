#include "fritzbox.h"
//%2Fhtml%2Fde%2FFRITZ%21Box_Anrufliste.csv&var%3Alang=de&login%3Acommand%2Fpassword=
const QByteArray FritzBox::POSTDATA_CSV = "getpage=..%2Fhtml%2Fde%2FFRITZ%21Box_Anrufliste.csv";
const QByteArray FritzBox::POSTDATA_LOGIN = "&login%3Acommand%2Fpassword=";
const QByteArray FritzBox::POSTDATA_PHONE_BOOK = "getpage=..%2Fhtml%2Fde%2Ffon%2FppFonbuch.html&var%3Alang=de";
const QByteArray FritzBox::POSTDATA_PHONE_BOOK1 = "getpage=..%2Fhtml%2Fde%2Fmenus%2Fmenu2.html&errorpage=..%2Fhtml%2Fde%2Fmenus%2Fmenu2.html&var%3Alang=de&var%3Apagename=fonbuch&var%3Aerrorpagename=fonbuch&var%3Amenu=home&var%3Apagemaster=&time%3Asettings%2Ftime=1196667654%2C-60&var%3Aactivtype=pppoe&var%3AtabInetstat=1";
const QByteArray FritzBox::POSTDATA_CALL_LIST = "getpage=..%2Fhtml%2Fde%2Fmenus%2Fmenu2.html&var%3Alang=de&var%3Amenu=fon&var%3Apagename=foncalls";
const QByteArray FritzBox::POSTDATA_CALL_LIST_ALL = "getpage=..%2Fhtml%2Fde%2Fmenus%2Fmenu2.html&var%3Alang=de&var%3Amenu=fon&var%3Apagename=foncalls&var%3Ashowall";
const QByteArray FritzBox::POSTDATA_CALL = "";

// FritzBox::FritzBox(QWidget *parent,const QString &_passwort,const QString &_host,int _port)
// :host(_host),passwort(_passwort),port(_port),postheader("POST", "/cgi-bin/webcm")
FritzBox::FritzBox(QWidget *parent ,QSettings& cfg, int _port)
:settings(cfg),postheader("POST", "/cgi-bin/webcm"),httpPort(_port), host("fritz.box")
{
	//QString host();
	http = new QHttp(host,httpPort);
	postheader.setValue("Host", host/*"fritz.box"*/); 
  	postheader.setContentType("application/x-www-form-urlencoded");
	
	LoadSettings();
	
	connect(http,SIGNAL(done(bool)),this,SLOT(Seite_geladen(bool)));
	connect(http,SIGNAL(dataReadProgress(int, int)), parent, SLOT(ReadProgress(int,int)));
}
	
FritzBox::~FritzBox(){
	delete http;
}

void FritzBox::LoadSettings()
{
 host 		= settings.value("common/IP", "fritz.box").toString();
 port 		= settings.value("common/Port", "1012").toInt();
 password 	= settings.value("common/password", "").toString();
 
 postheader.removeValue("Host");
 postheader.setValue("Host", host/*"fritz.box"*/); 
}

void FritzBox::UpdateSettings(){LoadSettings();}

void FritzBox::Seite_geladen(bool error){
	//reagiert nur auf die letzte Anfrage!!
	if (error){
		QMessageBox::critical( NULL, tr("Fritz Box Fehler"), http->errorString ());
	}
	else{
		//QFile temp("test.html");
		/*temp.open(QIODevice::WriteOnly);
		if (temp.isWritable ()){
				temp.write();
		}*/
		QHttpResponseHeader antwort = http->lastResponse();
// Debug Code
// 		std::cout <<"geladen "<< antwort.toString().toStdString()<<std::endl;
// 
// 		{ int i;
//  		for (i=0; i< antwort.values().count(); i++)
// 		std::cout << antwort.values().takeAt(i).first.toStdString() << " : " << antwort.values().takeAt(i).second.toStdString() << std::endl;
// 		}
// Debug Code end

		QByteArray daten(http->readAll());

// Debug Code
//  		std::cout << "Inhalt: "<< daten.data()<<std::endl;
// 

		if (antwort.value("content-disposition").contains("FRITZ!Box_Anrufliste.csv"))
			verarbeite_csv(daten);
		else
// 		if (daten.contains("<title>Telefonbuch - Druckansicht</title>")){
		if (daten.contains("Telefonbuch")){
// 		if (RequestStr == POSTDATA_PHONE_BOOK){
	 		QTextStream input(daten);
			emit neues_telefonbuch(input.readAll());
		}
		
	}
}

void FritzBox::holeSeite(const QByteArray &postdaten){
	RequestStr = postdaten;
	if (!password.isEmpty())
		RequestID = http->request(postheader,postdaten + POSTDATA_LOGIN + QUrl::toPercentEncoding(password));
	else
  		RequestID = http->request(postheader, postdaten);
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
	http->setHost(host, httpPort);
	holeSeite(POSTDATA_CALL_LIST);
	holeSeite(POSTDATA_CSV);
}

void FritzBox::hole_telefonbuch(){
	http->clearPendingRequests();
	http->setHost(host, httpPort);
// 	holeSeite(POSTDATA_PHONE_BOOK);
	holeSeite(POSTDATA_PHONE_BOOK1);
}
