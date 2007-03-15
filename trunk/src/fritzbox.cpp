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
  	std::cout <<"fritzbox erzeugt "<<std::endl;
	connect(http,SIGNAL(done(bool)),this,SLOT(Seite_geladen(bool)));
}
	
FritzBox::~FritzBox(){
	delete http;
}

void FritzBox::Seite_geladen(bool error){
	std::cout << "In Requestliste: "<<requestliste.count()<<std::endl;
	Request request = requestliste.takeFirst();
	if (error){
		QMessageBox::critical( NULL, tr("Fritz Box Fehler"), http->errorString ());
	}else{
		//QFile temp("test.html");
		/*temp.open(QIODevice::WriteOnly);
		if (temp.isWritable ()){
				temp.write();
		}*/
		std::cout <<"geladen "<< request.type <<std::endl;
		
		switch (request.type){
			case R_CSV:
				verarbeite_csv(http->readAll());
				break;
			case R_IGNORE:
			default:
				break;
		}
	}
}

bool FritzBox::Request::operator==(Request &request){
	return this->id == request.id;
}

void FritzBox::holeSeite(const QByteArray &postdaten, REQUEST_TYPE requesttype){
	Request temp;
	temp.type =requesttype;
	if (!passwort.isEmpty())
		temp.id = http->request(postheader,postdaten + POSTDATA_LOGIN + QUrl::toPercentEncoding(passwort));
	else
  		temp.id = http->request(postheader, postdaten);
  	requestliste.push_back(temp);
}

void FritzBox::verarbeite_csv(QByteArray daten){
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
	holeSeite(POSTDATA_CALL_LIST,R_IGNORE);
	requestliste.pop_front();
	holeSeite(POSTDATA_CSV,R_CSV);
}
