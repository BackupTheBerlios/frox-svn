#ifndef FRITZBOX_H_
#define FRITZBOX_H_

#include <QtCore>
#include <QtNetwork>
#include <QMessageBox>
#include <iostream>

class FritzBox:public QObject{
	Q_OBJECT
	
	static const QByteArray POSTDATA_CSV,POSTDATA_LOGIN,POSTDATA_PHONE_BOOK,POSTDATA_CALL_LIST,POSTDATA_CALL_LIST_ALL,POSTDATA_CALL;

	QString host,passwort;
	int port;
	QHttp *http;
	QHttpRequestHeader postheader;//geht nicht??
	
signals:
	void neue_anrufliste(QString daten,QChar seperator);
	void neues_telefonbuch(QString daten);
public slots:
	void Seite_geladen(bool error);
public:
	FritzBox(QWidget *parent ,const QString &_passwort,const QString &_host = "fritz.box",int _port = 80);
	~FritzBox();
	void holeSeite(const QByteArray &postdaten);
	void verarbeite_csv(QByteArray &daten);
	void hole_anrufliste();
	void hole_telefonbuch();
private:	
	int RequestID;
	QByteArray RequestStr;
};

#endif /*FRITZBOX_H_*/
