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

 #include <QtGui>

 #include "importdialog.h"

 #define MESSAGE \
     Dialog::tr("<p>Message boxes have a caption, a text, " \
                "and any number of buttons, each with standard or custom texts." \
                "<p>Click a button to close the message box. Pressing the Esc button " \
                "will activate the detected escape button (if any).")

Dialog::Dialog(QWidget *parent, QString FName)
     : QDialog(parent)
{
	int frameStyle = QFrame::Sunken | QFrame::Panel;
	
	separator = new QLineEdit;
	separator->setText("\t");

	QPushButton *StartButton = new QPushButton(tr("Scan"));

	QLabel *LabSep = new QLabel;
	LabSep->setFrameStyle(frameStyle);
	LabName = new QLabel;
	LabName->setFrameStyle(frameStyle);
	LabNumber = new QLabel;
	LabNumber->setFrameStyle(frameStyle);
	LabShort = new QLabel;
	LabShort->setFrameStyle(frameStyle);
	LabVanity = new QLabel;
	LabVanity->setFrameStyle(frameStyle);

	LabSep->setText("Separator");
	LabName->setText("Name");
	LabNumber->setText("Number");
	LabShort->setText("Short");
	LabVanity->setText("Vanity");

	SpinName = new QSpinBox;
	SpinName->setRange(1, 100);
	SpinName->setSingleStep(1);
	SpinName->setValue(1);

	SpinNumber = new QSpinBox;
	SpinNumber->setRange(1, 100);
	SpinNumber->setSingleStep(1);
	SpinNumber->setValue(2);

	SpinShort = new QSpinBox;
	SpinShort->setRange(1, 100);
	SpinShort->setSingleStep(1);
	SpinShort->setValue(3);

	SpinVanity = new QSpinBox;
	SpinVanity->setRange(1, 100);
	SpinVanity->setSingleStep(1);
	SpinVanity->setValue(4);

	QGridLayout *layout = new QGridLayout;
	layout->setColumnStretch(1, 1);
	layout->setColumnMinimumWidth(1, 10);
	
	layout->addWidget(LabSep,0,0);
	layout->addWidget(separator,0,1);
// 	layout->addWidget(StartButton, 0, 1);
	
	layout->addWidget(LabName, 1, 0);
	layout->addWidget(SpinName, 1, 1);
	layout->addWidget(LabNumber, 2, 0);
	layout->addWidget(SpinNumber, 2, 1);
	layout->addWidget(LabShort, 3, 0);
	layout->addWidget(SpinShort, 3, 1);
	layout->addWidget(LabVanity, 4, 0);
	layout->addWidget(SpinVanity, 4, 1);

	QPushButton *FinishButton = new QPushButton(tr("Import"));
	layout->addWidget(FinishButton, 5, 1);
	setLayout(layout);
	setWindowTitle(tr("Import phonebook"));

	connect(StartButton, SIGNAL(clicked()), this, SLOT(ScanInputFile()));
	connect(FinishButton, SIGNAL(clicked()), this, SLOT(DoImport()));
	FileName = FName;
	
	QFile file(FileName);
	if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
		return;

	while (!file.atEnd()) {
	     QByteArray line = file.readLine();
	     Lines.append(line);
	}
}

void Dialog::ScanInputFile(){

 }
 
void Dialog::DoImport(){
   emit OnImportStart(separator->text(), SpinName->value(),SpinNumber->value(), SpinShort->value(), SpinVanity->value(), Lines);
   close();
//    delete this;
}

