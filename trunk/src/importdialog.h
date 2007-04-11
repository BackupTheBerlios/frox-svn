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

 #ifndef DIALOG_H
 #define DIALOG_H

 #include <QDialog>
 #include <QLineEdit>
 #include <QSpinBox>
 #include <QStringList>

 class QLabel;
 class QErrorMessage;

 class Dialog : public QDialog
 {
     Q_OBJECT

 public:
     Dialog(QWidget *parent = 0, QString FName ="");

 signals:
 	void OnImportStart(QString sep, int N_Name, int N_Number, int N_Short, int N_Vanity, QStringList Lines);

 private slots:
	void ScanInputFile();	
	void DoImport();

 private:
     QLabel *integerLabel;
     QLineEdit *separator;
     QLabel *LabName, *LabNumber, *LabShort, *LabVanity;
     QSpinBox *SpinName, *SpinNumber, *SpinShort, *SpinVanity;
     
     QStringList Lines;
     QString 	 FileName;
     

 };

#endif

