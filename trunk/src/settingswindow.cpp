 /****************************************************************************
 **
 ** Copyright (C) 2004-2007 Trolltech ASA. All rights reserved.
 **
 ** This file is part of the example classes of the Qt Toolkit.
 **
 ** This file may be used under the terms of the GNU General Public
 ** License version 2.0 as published by the Free Software Foundation
 ** and appearing in the file LICENSE.GPL included in the packaging of
 ** this file.  Please review the following information to ensure GNU
 ** General Public Licensing requirements will be met:
 ** http://www.trolltech.com/products/qt/opensource.html
 **
 ** If you are unsure which license is appropriate for your use, please
 ** review the following information:
 ** http://www.trolltech.com/products/qt/licensing.html or contact the
 ** sales department at sales@trolltech.com.
 **
 ** This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING THE
 ** WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
 **
 ****************************************************************************/


#include "settingswindow.h"

SettingsWindow::SettingsWindow(QSettings& cfg)
 :settings(cfg)
{
	int frameStyle = QFrame::Sunken | QFrame::Panel;
	setWindowTitle(tr("settings"));
	
	FBAdress	= new QLineEdit;
	FBPort 		= new QLineEdit;
	FBPassword 	= new QLineEdit;
	hidden = new QCheckBox("start hidden", this);
	
	LoadSettings();
	
	QLabel *FBAdressLabel 	= new QLabel("Adress of your Fritz!Box");
	QLabel *FBPortLabel 	= new QLabel("Port");
	QLabel *FBPasswordLabel = new QLabel("Your password");
	
	
	FBAdressLabel	->setFrameStyle(frameStyle);
	FBPortLabel		->setFrameStyle(frameStyle);
	FBPasswordLabel	->setFrameStyle(frameStyle);
	
	QPushButton *finishButton = new QPushButton(tr("ok"));
	QPushButton *cancelButton = new QPushButton(tr("cancel"));
	
	connect(finishButton, SIGNAL(clicked()), this, SLOT(SaveSettings()));
	connect(cancelButton, SIGNAL(clicked()), this, SLOT(close()));
	

	QGridLayout *layout = new QGridLayout;
	layout->setColumnStretch(1, 1);
	layout->setColumnMinimumWidth(1, 100);
	
	layout->addWidget(FBAdressLabel,0,0);
	layout->addWidget(FBAdress,0,1);
	layout->addWidget(FBPortLabel,1,0);
	layout->addWidget(FBPort,1,1);
	layout->addWidget(FBPasswordLabel,2,0);
	layout->addWidget(FBPassword,2,1);
	layout->addWidget(hidden,3,0);

	layout->addWidget(cancelButton, 5, 0);
	layout->addWidget(finishButton, 5, 1);
	setLayout(layout);
	
}

void SettingsWindow::SaveSettings(){
	bool checked = false;
	settings.setValue("common/IP",		FBAdress	->text());
	settings.setValue("common/Port",	FBPort	->text());
	settings.setValue("common/password",	FBPassword	->text());
	checked = (hidden->checkState() == Qt::Checked)  ? true : false;
	settings.beginGroup("HauptFenster");
	settings.setValue("StartHidden", checked);
	settings.endGroup();
	settings.sync();
	close();
	emit SettingsChanged();
	delete this;
}

void SettingsWindow::LoadSettings()
{
	FBAdress	->setText(settings.value("common/IP", "fritz.box").toString());
	FBPort		->setText(settings.value("common/Port", "1012").toString());
	FBPassword	->setText(settings.value("common/password", "").toString());
	settings.beginGroup("HauptFenster");
	if (settings.value("StartHidden", false) == true)
		hidden->setCheckState(Qt::Checked);
	settings.endGroup();
}


