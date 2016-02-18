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
|* 				nm_make_functions.h			      *|
|******************************************************************************|
\******************************************************************************/
#ifndef NM_MAKE_FUNCTIONS_H
#define NM_MAKE_FUNCTIONS_H

//nm_make_functions
QString 		nm_make_type		(QString id, QString system);

QString 		nm_make_netmask_x	(QString _netmask);
QString 		nm_make_netmask_wxyz	(QString _netmask);

QMap<QString, QString> 	nm_make_connection	(QString id, QString type);
QMap<QString, QString> 	nm_make_ethernet	(QString id);
QMap<QString, QString> 	nm_make_wifi		(QString id, QString ssid, QString security);
QMap<QString, QString> 	nm_make_wifi_security	(QString passwd);
QString 		nm_make_encrypt_password(QString ssid, QString passwd);

QString 		nm_make_ipv4_address	(QString ip, QString netmask, QString gateway);
QMap<QString, QString> 	nm_make_ipv4_static	(QString ip, QString netmask, QString gateway, QString dns);
QMap<QString, QString> 	nm_make_ipv4_dhcp	();
QMap<QString, QString> 	nm_make_ipv6_dhcp	();
bool 			nm_make_networkmanager_restart(QString system);

#endif //NM_MAKE_FUNCTIONS_H
