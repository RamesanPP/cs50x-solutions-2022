-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT * FROM people;

SELECT id FROM crime_scene_reports WHERE month = 7 and day = 28 and street = "Chamberlin Street";

SELECT transcript FROM interviews WHERE month = 7 and day = 28 and transcript LIKE "#courthouse%";

SELECT activity FROM courthouse_security_logs;

SELECT name FROM people JOIN courthouse_security_logs ON people.license_plate = courthouse_security_logs.license_plate
WHERE month = 7 and day = 28 and hour = 10 and minute >= 15 and minute < 25 and activity = "exit";

SELECT DISTINCT name FROM people
    JOIN bank_accounts ON people.id = bank_accounts.person_id
    JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE month = 7 and day = 28 and transaction_type = "withdraw" and atm_location = "Fifer Street";

SELECT name FROM people
    JOIN passengers ON people.passport_number = passengers.passport_number
WHERE flight_id = (SELECT id FROM flights WHERE month = 7 and day = 29 ORDER BY hour, minute LIMIT 1);

SELECT name FROM people
    JOIN phone_calls ON people.phone_number = phone_calls.caller
WHERE month = 7 and day = 28 and duration < 60;



SELECT name FROM people
    JOIN passengers ON people.passport_number = passengers.passport_number
WHERE flight_id = (SELECT id FROM flights WHERE month = 7 and day = 29 ORDER BY hour, minute LIMIT 1)
INTERSECT
SELECT DISTINCT name FROM people
    JOIN bank_accounts ON people.id = bank_accounts.person_id
    JOIN atm_transactions ON bank_accounts.account_number = atm_transactions.account_number
WHERE month = 7 and day = 28 and transaction_type = "withdraw" and atm_location = "Fifer Street"
INTERSECT
SELECT name FROM people
    JOIN phone_calls ON people.phone_number = phone_calls.caller
WHERE month = 7 and day = 28 and duration < 60
INTERSECT
SELECT name FROM people JOIN courthouse_security_logs ON people.license_plate = courthouse_security_logs.license_plate
WHERE month = 7 and day = 28 and hour = 10 and minute >= 15 and minute < 25 and activity = "exit";

SELECT city FROM airports
WHERE id = (SELECT destination_airport_id FROM flights
WHERE month = 7 and day = 29 ORDER BY hour, minute LIMIT 1);

SELECT name FROM people
    JOIN phone_calls ON people.phone_number = phone_calls.receiver
WHERE month = 7 and day = 28 and duration < 60 and caller = (SELECT phone_number FROM people WHERE name = "Ernest"