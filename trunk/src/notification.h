#ifndef NOTIFICATIONWINDOW_H
#define NOTIFICATIONWINDOW_H

#include <QtGui>
#include <iostream>

//#include "trayicon.h"

class NotificationWindow : public QFrame
{
	Q_OBJECT

	public:
	NotificationWindow();
	void ShowCall(int id);
	
	QPushButton *bleft;
	QPushButton *bright;
	QLabel	*LabelTitle;
	QLabel	*LabelId;
	QLabel	*LabelNumber;
	QLabel	*LabelDatetime;
	QLabel	*LabelMsn;
	int 	lastCall;
	
	signals:
		void OnCloseWindow();
		void nextCall();
		void prevCall();

	private slots:
		void CloseWindow();
		void brightClicked(){emit nextCall();}
		void bleftClicked() {emit prevCall();}
		
	private:
		void readSettings();
		void writeSettings();
		
 		QPushButton  *closeButton;
// 		QSettings& settings;
};

#endif
