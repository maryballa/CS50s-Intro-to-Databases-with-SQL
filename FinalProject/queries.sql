-- Find all patients with A blood type
SELECT *
FROM "patients"
WHERE "blood_type" = 'A';

-- Find all patients that have been prescribed ibuprofen
SELECT *
FROM "patients"
WHERE "patient_id" IN (
    SELECT "patiend_id"
    FROM "prescription"
    WHERE "med_id" = (
        SELECT "med_id"
        FROM "medicine"
        WHERE "med_name" = 'Ibuprofen'
    )
);

-- Find a patient's Name, Gender, Room and Lab_screening info
SELECT "patient_Fname", "patient_Lname", "gender", "room_id", "lab_id", "date" AS "Lab_Screening_Date"
FROM "patients"
LEFT JOIN "rooms" ON "patients"."patient_id" = "rooms"."patient_id"
LEFT JOIN "lab_screening" ON "patients"."patient_id" = "lab_screening"."patient_id"
WHERE "patient_id" = 1;

-- Find a doctor's appointments of the day
SELECT *
FROM "appointments"
WHERE "doctor_id" = 1
AND "date" = current_date;

-- Add a new patient
INSERT INTO "patients" ("patient_Fname", "patient_Lname", "blood_type", "gender", "condition", "admission_date", "discharge_date", "phone", "email")
VALUES ('Alex', 'Tate', 'A', 'Male', 'Appendicitis', '2025-03-15', '2025-03-20', '123456789', 'alexT@gmail.com');




