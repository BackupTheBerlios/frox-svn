        ��  ��                  �   ,   �� A R R O W S         0          (               �                  ���      N� �Q    ��� ���                                   C3@    334    C33@ D  3344DDDDD3C4B"""C334B""$C334B""@334B""$C334B""$3334B$"DDDDDB@B""@  D ""$  @  B""@    "$      B@  �   4   �� A R R O W S D O W N         0          (               �                  ���     F�� �Q    ��� ���                                   C3@    334    C33@ D  3344DDDDD3C4B"""C334B""$C334B""@334B""$C334B""$3334B$"DDDDDB@B""@  D ""$  @  B""@    "$      B@  �   0   �� A R R O W S U P         0          (               �                  ���      N� �    ��� ���                                   C3@    334    C33@ D  3344DDDDD3C4B"""C334B""$C334B""@334B""$C334B""$3334B$"DDDDDB@B""@  D ""$  @  B""@    "$      B@  �   8   �� A R R O W S U P D O W N         0          (               �                  ���     F�� �    ��� ���                                   C3@    334    C33@ D  3344DDDDD3C4B"""C334B""$C334B""@334B""$C334B""$3334B$"DDDDDB@B""@  D ""$  @  B""@    "$      B@  (      �� ��2     0          (                                   ���      N� �Q    ��� ���                                 C3A334C33AD3344DDDDD3C4B"""C334B""$C334B""A334B""$C334B""$3334B$"DDDDDBAB""AD""$AB""A"$BA�  �>  �  �              �                8  |  �  �  �  (   ��
 E X T I P                   POST /upnp/control/WANCommonIFC1 HTTP/1.1
Content-Type: text/xml; charset="utf-8"
Content-Length: 297
SOAPACTION: "urn:schemas-upnp-org:service:WANIPConnection:1#GetExternalIPAddress"

<?xml version="1.0" encoding="utf-8"?>
<s:Envelope s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
   <s:Body>
      <u:GetExternalIPAddress xmlns:u="urn:schemas-upnp-org:service:WANIPConnection:1" />
   </s:Body>
</s:Envelope>
   �  0   ��
 R E C O N N E C T                   POST /upnp/control/WANIPConn1 HTTP/1.1
SOAPACTION: "urn:schemas-upnp-org:service:WANIPConnection:1#ForceTermination"
CONTENT-TYPE: text/xml ; charset="utf-8"
Content-Length: 293

<?xml version="1.0" encoding="utf-8"?>
<s:Envelope s:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:s="http://schemas.xmlsoap.org/soap/envelope/">
   <s:Body>
      <u:ForceTermination xmlns:u="urn:schemas-upnp-org:service:WANIPConnection:1" />
   </s:Body>
</s:Envelope>
    (   �� A R R O W       0                 (  2 