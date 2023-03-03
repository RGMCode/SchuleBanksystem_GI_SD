# Abfragen in beschreibender Form inkl. Lösung erstellen zu: 
## Einfache Abfragen mit und ohne where / logischen Verknüpfungen (und/oder/not) zur DB inkl. Aggregatfunktionen (SUM, Max, Min, Avg, Count) (insgesamt 10 mit unterschiedlichen Funktionen) 

### 1. Wie viele Länder haben wir in der Datanbank?
<details>
  <summary>Musterlösung</summary>
  
```sql
Select Count(*) from Country
```
</details>

### 2. Wie viel Geld haben die Kunden Durchschnittlich auf ihrem Konto?
<details>
  <summary>Musterlösung</summary>
  
```sql
Select AVG(Balance) from Account
```
</details>

### 3. Wie viele Kunden haben eine Visa Karte?
<details>
  <summary>Musterlösung</summary>
  
```sql
SELECT COUNT(*) 
FROM Card
WHERE CardTyp LIKE '%visa%';
```
</details>

### 4. Wie viel Geld haben alle Kunden zusammen in ihren Konten?
<details>
  <summary>Musterlösung</summary>
  
```sql
Select SUM(Balance) from Account
```
</details>

### 5. Zeige den größten Geldbetrag aller Konten an
<details>
  <summary>Musterlösung</summary>
  
```SQL
select max(balance) from account
```
</details>

### 6. Zeige den kleinsten Geldbetrag aller Konten an
<details>
  <summary>Musterlösung</summary>
  
```SQL
select min(balance) from account
```
</details>

### 7. Zeige an wie viele Karten ausgegeben wurden
<details>
  <summary>Musterlösung</summary>
  
```SQL
select count(cardid) from card
```
</details>

### 8. Zeige alle accounts an deren accounttypid 1 oder 2 ist
<details>
  <summary>Musterlösung</summary>
  
```SQL
select * from account
where accounttypid=1 or accounttypid=2
```
</details>

### 9. Zeige alle banken an die das wort Bank enthalten
<details>
  <summary>Musterlösung</summary>
  
```SQL
select * from bank
where name like '%bank%'
```
</details>

### 10. Zeige alle Accounts an deren Dispo über 1000 oder unter 700 liegt
<details>
  <summary>Musterlösung</summary>
  
```SQL
SELECT * FROM account
WHERE dispositions > 1000 or dispositions < 700
```
</details>

### 11. Zeige viel geld insgesamt verschoben worden ist bei dem account mit der ID 1
<details>
  <summary>Musterlösung</summary>
  
```SQL
select SUM(Amount) from transactions
where FromAccountID =1
```
</details>


## Order by
### 12. Zeige alle Karten nach ihrer Gültigkeit an (Die Karten die zuerst ablaufen sollen oben stehen)
<details>
  <summary>Musterlösung</summary>
  
```SQL
select * from card
order by ValidityDate ASC
```
</details>

## Having / Group by (je 2 sinnvolle Abfragen) 
### 13. Gruppiere alle Konten eines Kundens anhand der KundenId und gebe das Gesamtguthaben des Kunden sowie seine KundenID aus, deren Gesamtguthaben mehr als 50000€ beträgt.
<details>
  <summary>Musterlösung</summary>
  
```sql
Select CustomerID, sum(Balance) as Gesamtguthaben from account
GROUP BY CustomerID
having Gesamtguthaben >= 50000
```
</details>
  
Eine weitere Sinnvolle Abfrage ist mit den Daten unserer Datenbank nicht möglich.

## Eine Abfrage mit Case 
### 14. Gebe die Spalten LastName und Firstname aus und erstelle ein Case wo der Stafftyp 2 "Chef", Stafftyp 3 "Developer" und Stafftyp 4 "Administrator" heißt. Standartgemäß bei einer anderen Zahl soll "Mitarbeiter" ausgegeben werden.
<details>
  <summary>Musterlösung</summary>
  
```sql
Select LastName, FirstName,
Case
    When AccTypStaffId = 2 Then 'Chef'
    When AccTypStaffId = 3 Then 'Developer'
    When AccTypStaffId = 4 Then 'Administrator'
    ELSE 'Mitarbeiter'
END as Typ
from Staff
```
</details>

## Verschachtelte Abfrage mit Unterselekts (2-3 Abfragen)
### 15. Selektiere alle Transaktionen ersetzte jedoch die TranTypId mit der Description aus der transactiontyp Tabelle ohne ein Join zu verwenden
<details>
  <summary>Musterlösung</summary>
  
```sql
SELECT TransactionID, FromAccountID, ToAccountID, Amount ,
       (SELECT description
        FROM transactionstyp
        WHERE transactionstyp.TranTypID = transactions.TranTypID) AS Description,
        TransactionDateTime
FROM transactions
```
</details>
  
## Join (left, inner) 
### 16. Selektiere alle Mitarbeiter gesucht wird der Nachname, Vorname, Geburtstag, Mitarbeiterbezeichnung, Telefonnummer und die E-Mail Adresse
<details>
  <summary>Musterlösung</summary>
  
```sql
SELECT S.LastName, S.FirstName, S.Birthdate, ATS.Description, SC.Phonenumber, SC.Mail
FROM Staff AS S
INNER JOIN AccTypStaff ATS on S.AccTypStaffID = ATS.AccTypStaffID
INNER JOIN StaffContact SC on S.StaffID = SC.StaffID
```
  </details>
  
### 17. Selektiere die Person / Personen mit dem ISO3 Code ITA und dem ISO2 Code von Irland gesucht wird der Nachname, Vorname, IBAN, Stadt, Land und der ISO2 Code
<details>
  <summary>Musterlösung</summary>
  
```sql
SELECT Cu.Lastname, Cu.FirstName, A.IBAN, CO.Name, CO.ISO2
FROM Customer AS Cu
JOIN Contact C on C.ContactID = CU.ContactID
JOIN Account A on CU.CustomerID = A.CustomerID
JOIN City CI on C.CityID = CI.CityID
JOIN Country CO on CO.CountryID = CI.CountryID
WHERE ISO3 = 'ITA'
OR ISO2 = 'IE';
```
</details>
  
## Create, update, delete, insert, (drop table) (je 1-2 sinnvolle Abfragen) 

### 18. (Insert) Füge die Deutsche Demokratische Republik vollständig in der Länder Tabelle hinzu
<details>
  <summary>Musterlösung</summary>
  
```SQL
insert into Country (Name,ISO2,ISO3)
VALUE('Deutsche Demokratische Republik','DD','DDR');
```
</details>

### 19. (Delete) Lösche Deutsche Demokratische Republik aus der Länder Tabelle
<details>
  <summary>Musterlösung</summary>
  
```SQL
DELETE FROM country WHERE ISO3 = 'DDR'
```
</details>

### 20. (Update) Ändere das Geburtsdatum von Rene sinnvoll um
<details>
  <summary>Musterlösung</summary>
  
```SQL
update staff
set Birthdate = "01.01.1993"
where Staffid = 4
```
</details>

## Datum Optional
### 21. Datumsabfrage
Schreibe eine Abfrage, die den Vornamen, Nachnamen, das Geburtsdatum, den Kontostand, die Dispositionsmöglichkeiten und die IBAN aller Kunden anzeigt, die vor dem 1. Januar 1989 geboren wurden und deren Kontostand in aufsteigender Reihenfolge sortiert ist. Die Abfrage sollte die Tabellen customer und account verwenden und die date()-Funktion nutzen.
<details>
  <summary>Musterlösung</summary>
  
```SQL
SELECT
    cu.FirstName, cu.LastName, cu.Birthdate, a.Balance, a.Dispositions, a.IBAN
FROM customer AS cu
JOIN account a ON cu.CustomerID = a.CustomerID
WHERE Birthdate <= date('1989-01-01')
ORDER BY Balance ASC;
```
</details>
  
  
### 22. Datumsabfrage
Schreibe eine Abfrage, die die Nachnamen, Vornamen, Geburtsdaten, IBANs, Karten-IDs, Karten-Typen, Gültigkeitsdaten, Kartennummern und Seriennummern aller Kunden und Konten anzeigt, bei denen das Gültigkeitsdatum ihrer Karte am oder nach dem 1. Januar 2025 liegt. Die Ergebnisse sollten nach Gültigkeitsdatum in absteigender Reihenfolge sortiert werden. Die Abfrage sollte die Tabellen customer, account und card verwenden und die date()-Funktion nutzen.
<details>
  <summary>Musterlösung</summary>
  
```SQL
SELECT
    cu.LastName, cu.FirstName, cu.Birthdate, a.IBAN, ca.CardID,
    ca.CardTyp, ca.ValidityDate, ca.Cardnumber, ca.Serial
FROM customer AS cu
JOIN account a ON cu.CustomerID = a.CustomerID
JOIN card ca ON ca.CardID = a.CardID
WHERE ca.ValidityDate >= date('2025-01-01')
ORDER BY ValidityDate DESC;
```
</details>
  
### 23. Zusatz (Beinhaltet Einfache Abfragen, Having / Group By, Joins, Cases, Order By)
Schreibe eine SQL Anweisung, welche alle Transaktionen zusammenrechnet. Gruppiere diese Ergebnisse anhand der FromAccountId.
Beachte, dass alle Transaktionen mit dem TranTyp 2 und 3 *-1 berechnet werden müssen. Verwende dafür einen Case.
Zusatzlich gebe zu den Transaktionen den Account Inhaber mit seinen Vor- und Nachnamen an.
Gruppiere das Gesamtergebniss erneut mit einem Group By nach den Benutzern.
Gebe nur Kunden aus, deren gruppierte Transaktionen im positiv ist.
Gebe folgende Spalten zurück: CustomerId, FirstName, LastName, Total.
Sortiere das Ergebniss nach der CustomerId Aufwärts
  
<details>
  <summary>Musterlösung</summary>
  
```SQL
Select Balances.CustomerID, Balances.FirstName, Balances.LastName, sum(Balances.Balance) as total
from (
    Select
    c.CustomerID, c.FirstName, c.LastName, Sum(CASE
        WHEN TranTypID in (2, 3) THEN Amount * -1
        ELSE Amount
    END) as Balance
    from transactions
    inner JOIN account a on transactions.FromAccountID = a.AccountID
    inner JOIN customer c on a.CustomerID = c.CustomerID
    group by FromAccountID) as Balances
group by Balances.CustomerID
HAVING total > 0
Order BY CustomerId
```
</details>

