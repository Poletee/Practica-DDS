# OMNIPRESCENSE

[cat]
## **INTRO**
El projecte tracta en fer un package de R que obtindrà informació pública a internet per alimentar un sistema de tractament de dades (ja siguin IPs, dates, dominis) que permeti interacció amb l'usuari que l'està fent servir. Per aquest package de R s'ha d'entendre els següents conceptes:
* Data scope
* Sources
* Features/Functionalities

### **Data Scope**

Entenem Data Scope com a quins tipus de dades s'acceptaran en el package de R. Per començar i en funció de les complicacions del projecte, el Data Scope serà únicament adreces IP que tinguin certes dades, com pot ser (a ser posible): data, geolocalització, tipus de llista a la que pertany(campanya de malware, C&C, malware distribution, whatever),+ FALTA ACABAR DE DEFINIR.

### **Sources**

Donat que el Data Scope només és IPs, farem servir la següent pàgina web per obtenir informació de diferents llistes de IPs de diferents proveïdors de seguretat:
https://iplists.firehol.org/

### **Features/Functionalities**

A continuació hi ha un llistat de les posibles funcionalitats que es volen implementar:
	- Cercar en funció de la categoria (campanya concreta, anonimitzadors, distribuidor de malware,whatever)
	- Obtenir informació d'una IP en concret i veure posibles relacions properes en funció de la semblança amb altres IPs (campanya compartida, distancia del rang de IP, ASN,whatever)
	
## **Conclusió final**

El package en R servirà per poder navegar en funció de les dades que tenim i poder treure conclusions sobre la maliciositat de la informació del Data Scope. Tota aquesta informació obtinguda fent servir el package en R es farà servir per realitzar un informe en que es puguin veure diferents casos com els comentat anteriorment.

----

[eng]

How nice it would be being able to know with high fidelity weather an IP is malicious or not, and its relations from different malware campaigns, botnets, anonymizer, whatever… This project consists on creating a new R package that will get information from public sources to feed a data analysis system that will let a user to interact using some functionalities. In order to understand this R package you gotta know:
	- Data Scope
	- Sources
	- Functionalities

### **Data Scope**

We understand Data Scope as what different kind of data will be accepted in the R package. At first and based on contributer's availability, the Data Scope will only be IP addresses with added data related to each one (e.g. date, geolocation, source, trustworthiness, campaign, etc.). The parameters will be decided later once we see our needs. 

### **Sources**

As the Data Scope is only IPs and its related information, we'll be using the following webpage to get information from different IP lists from different sources:
https://iplists.firehol.org/

### **Features/Functionalities**

Here there is a list of possible functionalities that we'd like to develop. To be defined yet.
	- Look for a category (campaign, anonymizers, malware distribution, whatever) which will return a list of IPs and more info.
	- Get as much information as possible from an IP and from its relations (based on campaigns they shared, distance, ASN).

## **Conclusió final**

This R package will help security analysts to troubleshoot when doing incident hunting and incident response. The data obtained from the functionalities will be tested on a report and documented here.



**RELEASE THE KRAKEN**