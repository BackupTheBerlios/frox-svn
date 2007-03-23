#ifndef NOTIFICATIONWINDOW_H
#define NOTIFICATIONWINDOW_H

#include <QtGui>
#include <iostream>

class NotificationWindow : public QWidget
{
	Q_OBJECT

	public:
	NotificationWindow();
	
	signals:
		void OnCloseWindow();

	private slots:
		void CloseWindow();
	private:
		void readSettings();
		void writeSettings();
 		QPushButton  *closeButton;
// 		QSettings& settings;
};

#endif
