#ifndef FRITZBOX_H_
#define FRITZBOX_H_

#include <QtCore>
#include <QtNetwork>
#include <QMessageBox>
#include <iostream>

class FritzBox:public QObject{
	Q_OBJECT
	
	static const QByteArray POSTDATA_CSV,POSTDATA_LOGIN,POSTDATA_PHONE_BOOK,POSTDATA_CALL_LIST,POSTDATA_CALL_LIST_ALL;

	QString host,passwort;
	int port;
	QHttp *http;
	QHttpRequestHeader postheader;//geht nicht??
	
	enum REQUEST_TYPE{R_CSV,R_PHONE,R_IGNORE};
	struct Request{
		REQUEST_TYPE type;
		int id;
		bool operator==(Request &request);
	};
	QList<Request> requestliste;
signals:
	void neue_anrufliste(QString daten,QChar seperator);
	void neues_telefonbuch();
public slots:
	void Seite_geladen(bool error);
public:
	FritzBox(const QString &_passwort,const QString &_host = "fritz.box",int _port = 80);
	~FritzBox();
	void holeSeite(const QByteArray &postdaten, REQUEST_TYPE requesttype);
	void verarbeite_csv(QByteArray daten);
	void hole_anrufliste();
};

#endif /*FRITZBOX_H_*/
