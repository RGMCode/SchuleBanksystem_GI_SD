# Schule Banksystem
Banksystem
VP, GI, SD Projekt

# Link VP Aufgaben
https://docs.google.com/document/d/1dv1EPE_ydI9iNt9PUlzkRl7IJtoywFoNFPIKM6Xz82s/edit

<!--.
# Aufgabenteilung

| Breich | Namen | Fach |
|--------|-----|-----|
| GUI | Lorenzo, Daniel | VP |
| SQL Tabelle | Rene, Daniel | GI, VP |
| SQL Befehle | Rene, Daniel, Lorenzo | GI, VP |
| Diagramme | Rene, Daniel, Lorenzo | SD |
| Programmierung / Anzeigen der Daten | Lorenzo, Rene, Daniel | VP, GI |
| Datenbank Aufgaben | Lorenzo, Rene, Daniel | GI |
| Kontrolle | Lorenzo, Rene, Daniel | VP, GI, SD |
| Außenstehend / bisher nichts geleistet | Rohullah | Use Case Diagramm - Beschreibung |

-->

### ER-Diagramm
<img width="781" alt="image" src="https://user-images.githubusercontent.com/29029835/221170146-22eb5930-86a5-42ea-851b-5fb6d2b0d3ec.png">

# Beschreibungen und Abbildungen UML-Diagramme
### Klassendiagramm + Beschreibung inkl. Multiplizitäten, Klassenvariablen und Methoden
Die Datenbank "Bank" speichert Informationen über Konten, Kunden, Mitarbeitern, Transaktionen und Bankdaten.
Wir haben folgende Tabellen: "Account", "AccountTyp", "AccStatus", "AccTypStaff", "Bank", "Card", "City", "Contact", "Country", "Customer", "Login", "LoginTyp", "Sex", "Staff", "Transactions" und "TransactionsTyp".

Die Tabelle Account enthält informationen über den Account des Kundens. Jeder Eintrag in der Tabelle Account ist mit einer eindeutigen AccountID identifizierbar und enthält die folgenden Attribute: Eine Referenz zu der Tabelle Customer (CustomerID), das Guthaben (Balance), den Dispo (Dispositions), eine Referenz auf die Tabelle Accounttyp (AccountTypID), eine Referenz auf die Tabelle AccStatus (AccStatusID), eine Referenz auf die Tabelle Card (CardID) und die IBAN.

Die Tabelle Accounttyp enthält Informationen über den Typ eines Kontos. Jeder Eintrag in der Tabelle Accounttyp ist mit einer eindeutigen AccountTypID identifizierbar und enthält das folgende Attribut: Description.

Die Tabelle AccStatus enthält Informationen über den Status eines Kontos. Jeder Eintrag in der Tabelle AccStatus ist mit einer eindeutigen AccStatusID identifizierbar und enthält das folgende Attribut: Description.

Die Tabelle AccTypStaff enthält Informationen über die Rolle des Mitarbeiters. Jeder Eintrag in der Tabelle AccTypStaff ist mit einer eindeutigen AccTypStaffID identifizierbar und enthält das folgende Attribut: Description.

Die Tabelle Bank enthält Informationen über die Bank. Jeder Eintrag in der Tabelle Bank ist mit einer eindeutigen BankID identifizierbar und enthält folgende Attribute: Name, BIC und eine Referenz auf die Tabelle City (CityId).

Die Tabelle Card enthält Informationen über die Bankkarte eines Kunden. Jeder Eintrag in der Tabelle Card ist mit einer eindeutigen CardID identifizierbar und enthält folgende Attribute: Cardtyp , ValidityDate, Cardnumber und Serial.

Die Tabelle Contact enthält Informationen über Kontaktdaten der Kunden. Jeder Eintrag in der Tabelle Contact ist mit einer eindeutigen ContactID identifizierbar und enthält folgende Attribute: Mail, Telefonnummer (Phonenumber), Straße (Street), Hausnummer (Housenumber) und eine Referenz auf die Tabelle City (CityId).

Die Tabelle Country enthält Informationen über Länder. Jeder Eintrag in der Tabelle Country ist mit einer eindeutigen CountryID identifizierbar und enthält folgende Attribute: Name, ISO2 und ISO3.

Die Tabelle Customer enthält Informationen über Kunden der Bank. Jeder Eintrag in der Tabelle Customer ist mit einer eindeutigen KundenID (CustomerID) identifizierbar und enthält folgende Attribute: Nachname (LastName), Vorname (FirstName), eine Referenz auf die Tabelle Contact (ContactID), eine Referenz auf die Tabelle Bank (BankID), das Geburtsdatum (Birthdate) des Kunden, eine Referenz auf die Tabelle Staff (StaffID) für den zuständigen Mitarbeiter, eine Referenz auf die Tabelle Sex (SexID) für das Gschlecht des Kundens, Aktiv (Active) ob der kunde Freigeschaltet ist und Gesperrt (Blocked) ob der Kunde gesperrt wurde.

Die Tabelle City enthält Informationen über Orte. Jeder Eintrag in der Tabelle City ist mit einer eindeutigen CityID identifizierbar und enthält folgende Attribute: PLZ (ZIP), Ort (City) und eine Referenz auf die Tabelle Country (CountryID).

Die Tabelle Login enthält Informationen über alle Logindaten der Kunden, Mitarbeiter und den Karten. Jeder Eintrag in der Tabelle Login ist mit einer eindeutigen LoginID identifizierbar und enthält folgende Attribute: eine Referenz auf die Tabelle LoginTyp (LoginTyp), das Passwort des Kunden oder Mitarbeiter, die PIN der Karte, eine Referenz auf die Tabelle Customer (CustomerID), eine Referenz auf die Tabelle Staff (StaffID) und eine Referenz auf die Tabelle Card (CardID).

Die Tabelle LoginTyp enthält die Informationen um welchen Typ von Login es sich handelt. Der LoginTyp ist eindeutig über den LoginTyp erkennbar. Unteranderem enthält die Tabelle das Attribut Beschreibung (Description) um die Logintypen voneinander zu unterscheiden bzw. die typen richtig Zuzuweisen zu können.

Die Tabelle Sex enthält Informationen zu Geschlechtern von Mitarbeitern und Kunden. Jeder Eintrg in der Tabelle Sex ist mit einer eindeutigen SexID identifizierbar und enthält folgende Attribute: SexBeschreibung (SexDescription) und Anrede (Salutation).

Die Tabelle Staff enthält Informationen über Mitarbeiter der Bank. Jeder Eintrag in der Tabelle Staff ist mit einer eindeutigen StaffID identifizierbar und enthält folgende Attribute: Nachname (LastName), Vorname (FirstName), Geburtsdatum (Birthdate), eine Referenz auf die Tabelle AccTypStaff (AccTypStaffID) und eine Referenz auf die Tabelle Sex (SexID).

Die Tabelle StaffContact enthält Informationen über Kontaktdaten der Mitarbeiter. Jeder Eintrag in der Tabelle StaffContact ist mit einer Referenz auf die Tabelle Staff (StaffID) identifizierbar und enthält folgende Attribute: Telefonnummer (Phonenumber) und Mail.

Die Tabelle Transactions enthält Informationen über Transaktionen, die in der Bank durchgeführt wurden. Jeder Eintrag in der Tabelle Transactions ist mit einer eindeutigen TransactionID identifizierbar und enthält folgende Attribute: eine Referenz auf die Tabelle Account (FromAccountID), eine Referenz auf die Tabelle Account (ToAccountID), Betrag (Amount), Beschreibung (Purpose), Transaktionsdatum (TransactionDateTime) und eine Referenz auf die Tabelle TransactionsTyp (TranTypID).

Die Tabelle TransactionsTyp enthält Informationen über die verschiedenen Typen von Transaktionen. Jede Transaktion ist durch eine eindeutige TranTypID identifizierbar und hat eine Bezeichnung (Description), die beschreibt, um welchen Typ von Transaktion es sich handelt. Die Tabelle TransactionsTyp ist wichtig, um die Transaktionen in der Tabelle Transactions zu kategorisieren und zu identifizieren.

<img width="817" alt="image" src="https://user-images.githubusercontent.com/90555783/222378212-1375bc2c-e6ac-4cee-b29e-1c1824e23925.png">

<details>
  <summary>Anderes Klassendiagramm (vom Code)</summary>
  <img width="817" alt="image" src="https://user-images.githubusercontent.com/29029835/222525316-8bc20d38-d3f5-4a3f-aafd-30ec5dd1d930.png">

</details>

### Sequenzdiagramm + Beschreibung (Ausschnitt)
Schreibe ein Sequenz Diagramm zu der folgenden Beschreibung.
Der Kunde meldet sich bei dem ATM durch sein einschieben der Karte und eingeben der PIN an.
Daraufhin legt der ATM eine neue Datenbankverbindung an und prüft danach ob die Logindaten OK sind.
Sollten die Logindaten nicht Ok sein, dann bekommt der Kunde eine Nachricht.
Wenn die Logindaten ok sind, werden die weiteren Userdaten abgefragt und der Kunde wird an den Startbildschirm weitergeleitet.
Auf dem Startbildschirm sind 5 Buttons zu sehen. Diese sind "Auszahlen", "Einzahlen", "Überweisen", "Kontostand" anzeigen und "Karte Ausgeben"/Ausloggen.
Dabei betrachten wir nur den "Kontostand" anzeigen und den "Einzahlen" Button.
Wenn der Kunde auf den "Kontostand" Button drückt, öffnet sich ein Dialogund eine Verbindung zum Server wird hergestellt. Dieser Dialog sendet eine Abfrage an den Server um den aktuellen Kontostand abzufragen. Dieser wird dann in dem Dialog angezeigt. Nachdem der Server den Kontostand abgefragt hat, terminiert er sich wieder.
Wenn der Kunde auf den "Einzahlen" Button drückt, dann wird der Dialog angezeigt. Wenn der Kunde dann Geld eingelegt hat, wird der Eingelegte Betrag gezählt. Daraufhin erstellt der ATM wieder eine Verbindung zum Server und übergibt den Geldbetrag an diesen.
Der Server aktualisiert den Kontostand des Kunden und sendet eine Bestätigung an den ATM zurück, welcher dann eine Nachricht an den Kunden sendet.

In diesem Diagramm werden alle Buttons/Abzweigungen betrachtet.
<img width="781" alt="image" src="https://user-images.githubusercontent.com/29029835/222411296-000e71df-b468-46b6-b740-dd167d1bc65d.png">

### Anwendungsfalldiagramm / Use-Case Diagramm + Beschreibung (Ausschnitt)
(Rohullah)

Wir haben die Akteure "Kunde", "Mitarbeiter", "Administrator", "Manager" und "Entwickler" wobei
der "Administrator", "Manager" sowie "Entwickler" erweiterungen des "Mitarbeiter" sind.
Der Kunde kann ein Konto anfragen oder sich in einem Bestehendem Konto einloggen.
Wenn der Kunde sich eingeloggt hat, kann er eine Transaktion ausführen (Einzahlen, Auszahlen oder Überweisen).
Wenn der Kunde Überweisen ausgewählt hat, muss er eine Empfänger IBAN eines anderen verfügbaren Kontos eingeben.

Ein Mitarbeiter kann Kundendaten sowie Kundenkonten verwalten.
Wenn er ein Kunden Verwaltet, kann er die Kundendaten anpassen/ändern.
Sollte er ein Konto Verwalten, so kann er sofern ein Kunde ein Konto angefragt hat, dieses Freischalten.
Andernfalls kann er die Kontodaten ändern.

Ein Administrator kann Länder, Orte und Bankkarten (Cards) verwalten und anlegen, sofern diese noch nicht vorhanden sind.
Ebenfalls kann er Manager verwalten.

Ein Manager kann Mitarbeiter Verwalten.
Wenn der Mitarbeiter in der Verwaltung noch nicht vorhanden ist, kann der diesen anlegen und muss den Mitarbeitertypen festlegen.

Der Entwickler entwickelt die System weiter und betreibt den Support.

<img width="781" alt="image" src="https://user-images.githubusercontent.com/29029835/222537585-0428fed0-139f-44cb-9ae9-32fa2c7684eb.png">

### Zustandsdiagramms + Beschreibung (Ausschnitt)

Das Zustandsdiagramm beschreibt einen Bankautomaten.
Der Bankautomat verfügt über 6 Zustände:

- Betriebsbereit
- Auf Eingabe warten.
- Auszahldialog anzeigen.
- Einzahldialog anzeigen.
- Kontostanddialog anzeigen.
- Überweisungsdialog anzeigen.

Nachdem der Bankautomat gestartet ist, ist dieser betriebsbereit und wartet auf die Eingabe der Karte und der Pin.
Wenn die Kombination nicht stimmt, bleibt der Zustand.
Falls die Kombination richtig ist, dann wechselt der Zustand auf "Auf Eingabe warten".
Hier wird eine Auswahl getroffen zwischen "Karte entfernen"," Kontostand prüfen", "Überweisen", "Geld einzahlen", "Geld auszahlen".

- Karte entfernen bringt wieder den Zustand "Betriebsbereit"
- Kontostand prüfen zeigt den Kontostanddialog an.
- Überweisen zeigt den Überweisungsdialog an.
- Geld einzahlen zeigt den Einzahldialog an.
- Geld auszahlen zeigt den Auszahldialog an.

Aus jedem dieser Zustände kann man jederzeit in einen der anderen Zustände wechseln.

<img width="781" alt="image" src="https://user-images.githubusercontent.com/43998998/222529944-4289360e-b5d7-4a0b-9f0d-39bb76540480.png">

### Aktivitätsdiagramms (Ausschnitt)
<img width="781" alt="image" src="https://user-images.githubusercontent.com/29029835/222418642-c0b9f379-a15b-4d57-9dac-f0a128bed8be.png">

<details>
  <summary>Anderes Klassendiagramm (Riesig) (vom Code)</summary>
  <img width="817" alt="image" src="https://user-images.githubusercontent.com/29029835/222526138-faf4f71b-7a15-499a-8449-5cfc0c4343e4.png">

</details>

# Aufgaben Datenbank
siehe Aufgaben.sqlite
