/*******************************************************************************
 * Copyright (c) 2016, Andreas Thomas Haller, Cedrique Tassi
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *    1. Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *    2. Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *    3. The name of the authors may not be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *******************************************************************************/
 

/******************************************************************************\
|******************************************************************************|
|* 				unitTest.cpp				      *|
|******************************************************************************|
\******************************************************************************/

#include <QTest>
#include "../../../libs/nm+tools/inc/nm_check_functions.h"
#include "./unitTest.h"
#include "../../../libs/tools/inc/custom_exceptions.h"

//for installation: 	http://stackoverflow.com/questions/4753845/build-qt-tests-with-cmake
//for testing examples: http://doc.qt.io/qt-5/qtest-tutorial.html



//TODO include all testings from: src/networkmanager.cpp

void Test::example()
{
	QString str = "Hello";
	//little failure information
	QVERIFY(str.toUpper() == "HELLO");
	QString str1 = "Hello";
	//more failure information
	QCOMPARE(str1.toUpper(), QString("HELLO"));
}

/******************************************************************************\
|******************************************************************************|
|* 				check functions				      *|
|******************************************************************************|
\******************************************************************************/
/** 
 *  check_for_sign
 *  TODO not finished, only the special cases 
 */
void Test::test_check_for_sign_data()
{
	QTest::addColumn<QString>	("sign");
	QTest::addColumn<QString>	("phrase");
	QTest::addColumn<bool>		("output");
	QTest::addColumn<bool>		("developer");
	QTest::newRow("1") 	<< "[" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("2") 	<< "]" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("3") 	<< "{" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("4") 	<< "}" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("5") 	<< "(" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("6") 	<< ")" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("7") 	<< "\\"<< "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("8") 	<< "." << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("9") 	<< "+" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("10") 	<< "?" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("11") 	<< "|" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("12") 	<< "^" << "[]{}()\\.*+?|^$" << false << false;
	QTest::newRow("13") 	<< "$" << "[]{}()\\.*+?|^$" << false << false;
	
	QTest::newRow("14") 	<< "12" << "[]{}()\\.*+?|^$" << false << true;
}
/** 
 *  check_for_sign Data
 */
void Test::test_check_for_sign()
{
	QFETCH(QString, sign);
	QFETCH(QString, phrase);
	QFETCH(bool, 	output);
	QFETCH(bool, 	developer);

	if (output) 
		QCOMPARE(check_for_sign(sign, phrase, "test-phrase"), output);
	else
		if (developer) 
			QVERIFY_EXCEPTION_THROWN(check_for_sign(sign, phrase, "test-phrase") , developer_error);
		else
			QVERIFY_EXCEPTION_THROWN(check_for_sign(sign, phrase, "test-phrase") , customer_error);

}	   

/** 
 *  check_addr
 */
void Test::test_check_addr_data()
{
	QTest::addColumn<QString>	("input");
	QTest::addColumn<bool>		("output");
	QTest::newRow("1") << "118.8.8.8" 		<< true;
	QTest::newRow("2") << "8.8. 8.8 " 		<< false;
	QTest::newRow("3") << "8.8.8.08" 		<< false;
	QTest::newRow("4") << "8.8.008.8" 		<< false;
	QTest::newRow("5") << "8.8.8.00" 		<< false;
	QTest::newRow("6") << "1988.8.8.8 " 		<< false;
	QTest::newRow("7") << "270.8.8.8" 		<< false;
	QTest::newRow("8") << "255.255.255.255" 	<< true;
	QTest::newRow("9") << "0.0.0.0" 		<< true;
}
/** 
 *  check_addr Data
 */
void Test::test_check_addr()
{
	QFETCH(QString, input);
	//QFETCH(QString, output);
	QFETCH(bool, 	output);

	if (output) 
		QCOMPARE(check_addr(input, "vain"), output);
	else
		QVERIFY_EXCEPTION_THROWN(check_addr(input, "vain"), customer_error);

}
/** 
 *  check_dns
 */
void Test::test_check_dns_data()
{
	QTest::addColumn<QString>	("input");
	QTest::addColumn<bool>		("output");
	QTest::newRow("1") << "8.8.8.8;8.8.4.4" 	<< true;
	QTest::newRow("2") << "8.8.8.8;8.8.4.4;" 	<< true;
	QTest::newRow("3") << "8.8.8.8;8.8.4.4; " 	<< true;
	QTest::newRow("4") << "8.8.8.8; 8.8.4.4;" 	<< false;
	QTest::newRow("5") << "8.8.8.8" 		<< true;
	QTest::newRow("6") << "8.8.8.8 " 		<< false;
	QTest::newRow("6") << "8.8.8.8; " 		<< true;
}
/** 
 *  check_dns Data
 */
void Test::test_check_dns()
{
	QFETCH(QString, input);
	//QFETCH(QString, output);
	QFETCH(bool, 	output);

	if (output) 
		QCOMPARE(check_dns(input), output);
	else
		QVERIFY_EXCEPTION_THROWN(check_dns(input), customer_error);

}
/** 
 *  check_mac Data
 */

void Test::test_check_mac_data()
{
	QTest::addColumn<QString>	("input");
	QTest::addColumn<bool>		("output");

	QTest::newRow("1") << "F0:DE:F1:EF:7A:DB" 	<< true;
	QTest::newRow("2") << "F0:DE:F1:EF:7A:DB" 	<< true;
	QTest::newRow("3") << "F:De:F1:EF:7A:DB" 	<< false;
	QTest::newRow("4") << "De:F1:EF:7A:DB" 		<< false;
}

/** 
 *  check_mac Data
 */
void Test::test_check_mac()
{
	QFETCH(QString, input);
	//QFETCH(QString, output);
	QFETCH(bool, 	output);

	if (output) 
		QCOMPARE(check_mac(input), output);
	else
		QVERIFY_EXCEPTION_THROWN(check_mac(input), developer_error); // compiler error on Ubunntu with gcc version 5.3.0, same to all other exeption checkers
		//QVERIFY_EXCEPTION_THROWN( expression, exceptiontype)
}

QTEST_MAIN(Test)

//The QTEST_MAIN() macro expands to a simple main() method that runs all the test functions. Note that if both the declaration and the implementation of our test class are in a .cpp file, we also need to include the generated moc file to make Qt's introspection work.
//#include "unitTest.moc"
//#include "../unitTest.moc"





/*TODO additional tests:
	not finished
	   encrypt_passwd("eine Bar", "1234^./$[]*\"(){};,678");
	   encrypt_passwd("eine' Bar", "12345678");
	   encrypt_passwd("eine Bar", "123456'78");
	   encrypt_passwd("eine Bar", "1234");
	   encrypt_passwd("eine Bar", "1234567");//7
	   encrypt_passwd("eine Bar", "123456789012345678901234567890123456789012345678901234567890123");//63
	   encrypt_passwd("eine Bar", "1234567890123456789012345678901234567890123456789012345678901234"); //64
	   encrypt_passwd("eine Bar", "12345678901234567890123456789012345678901234567890123456789012345");//65
	   //check_ip_fits_gateway_with_netmask("198.168.178.33", "198.161.178.1", "24");

	   //nm_make_netmask_x("255.255.255.255");
	   //nm_make_netmask_x("7.256.7.0");
	   //nm_make_netmask_x("31");
	   //std::cout << nm_make_netmask_wxyz("255.255.7.0").toUtf8().constData() << std::endl;
	   //std::cout << nm_make_netmask_wxyz("25").toUtf8().constData() << std::endl;

	need changes
	   //std::cout << set_permission("root", "/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager/test") << std::endl;
	   std::cout << nm_make_ipv4_address("192.178.168.32", "255.255.255.0", "192.178.168.1").toUtf8().constData() << std::endl;
	   std::cout << nm_make_ipv4_address("192.177.168.32", "255.255.255.0", "192.178.168.1").toUtf8().constData() << std::endl;

	   get_uuid(); //uncomment the print output line
	   get_uuid();
	   get_uuid();
	   get_uuid();
	   //std::cout << check_file_for_existence("/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager/wlan");
	   //std::cout << check_file_for_existence("/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager/ethernet");
	   //std::cout << check_file_for_existence("/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager/ether");
	   //remove_wlan_if_existing("/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager/wlan");//wrong path
	   //remove_wlan_if_existing("/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager/");
	   //remove_wlan_if_existing("/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager");
	   //ini_reader(path);
	   //ini_saver(path + "X", ini_reader(path));   

	   //TODO test the nm_make_file_* functions
	   //nm_make_file("wlan", "debian", "Fritz!Box", "12345678", "dhcp", "192.178.168.32", "255.255.255.0", "192.178.168.1", "8.8.8.8;8.8.4.4", "/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager");

	   //nm_make_file("wlan", "debian", "/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager", "Fritz!Box", "12345678", "dhcp", "192.178.168.32", "255.255.255.0", "192.178.168.1", "8.8.8.8;8.8.4.4");
	   //nm_make_file_ethernet_dhcp("arch", "/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager");
	   //nm_make_file_wlan_dhcp("arch", "/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager", "Fritz!Box", "12345678");
	   //nm_make_file_ethernet_static("debian", "/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager", 
			//"192.178.168.32", "255.255.255.0", "192.178.168.1", "8.8.8.8;8.8.4.4");
	   //nm_make_file_wlan_static("arch", "/data/Dokumente/uniHeidelberg/9Semester/C++_Practice/network_manager", 
	   //              "Fritz!Box", "12345678", "192.178.168.32", "255.255.255.0", "192.178.168.1", "8.8.8.8;8.8.4.4");



	not possible
	   //check_mac(get_mac("ethernet"));
	   //check_mac(get_mac("wlan"));
*/
