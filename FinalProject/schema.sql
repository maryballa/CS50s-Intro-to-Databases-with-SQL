CREATE TABLE "patients" (
    "patient_id" INTEGER,
    "patient_Fname" TEXT NOT NULL,
    "patient_Lname" TEXT NOT NULL,
    "blood_type" TEXT,
    "gender" TEXT,
    "condition" TEXT NOT NULL,
    "admission_date" NUMERIC,
    "discharge_date" NUMERIC,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    PRIMARY KEY("patient_id")
)

CREATE TABLE "rooms" (
    "room_id" INTEGER,
    "patient_id" INTEGER,
    "room_type" TEXT,
    "availability" INTEGER NOT NULL CHECK("availability" IN (0,1)) DEFAULT 1,
    "room_cost" INTEGER,
    PRIMARY KEY("room_id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id")
)

CREATE TABLE "medicine" (
    "med_id" INTEGER,
    "med_name" TEXT,
    "med_quantity" TEXT,
    "med_cost" REAL,
    PRIMARY KEY("med_id")
)

CREATE TABLE "doctors" (
    "doctor_id" INTEGER,
    "emp_id" INTEGER,
    "specialization" TEXT NOT NULL,
    PRIMARY KEY("doctor_id"),
    FOREIGN KEY("emp_id") REFERENCES "staff"("emp_id")
)

CREATE TABLE "prescription" (
    "prescription_id" INTEGER,
    "patient_id" INTEGER,
    "date" NUMERIC,
    "dosage" TEXT,
    "doctor_id" INTEGER,
    "med_id" INTEGER,
    PRIMARY KEY("prescription_id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id"),
    FOREIGN KEY("doctor_id") REFERENCES "doctors"("doctor_id"),
    FOREIGN KEY("med_id") REFERENCES "medicine"("med_id")
)

CREATE TABLE "lab_screening" (
    "lab_id" INTEGER,
    "patient_id" INTEGER,
    "doctor_id" INTEGER,
    "test_cost" REAL,
    "technician_id" INTEGER,
    "date" NUMERIC,
    PRIMARY KEY("lab_id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id"),
    FOREIGN KEY("doctor_id") REFERENCES "doctors"("doctor_id")
)

CREATE TABLE "nurses" (
    "nurse_id" INTEGER,
    "patient_id" INTEGER,
    "emp_id" INTEGER,
    "department_id" INTEGER,
    PRIMARY KEY("nurse_id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id"),
    FOREIGN KEY("emp_id") REFERENCES "staff"("emp_id"),
    FOREIGN KEY("department_id") REFERENCES "department"("department_id")
)

CREATE TABLE "staff" (
    "emp_id" INTEGER,
    "emp_Fname" TEXT NOT NULL,
    "emp_Lname" TEXT NOT NULL,
    "date_joining" NUMERIC,
    "date_seperation" NUMERIC,
    "emp_type" TEXT NOT NULL,
    "department_id" INTEGER,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT,
    "SSN" INTEGER NOT NULL,
    PRIMARY KEY("emp_id"),
    FOREIGN KEY("department_id") REFERENCES "department"("department_id")
)

CREATE TABLE "appointment" (
    "app_id" INTEGER,
    "date" NUMERIC,
    "time" NUMERIC,
    "doctor_id" INTEGER,
    "patient_id" INTEGER,
    "scheduled_on" NUMERIC,
    PRIMARY KEY("app_id"),
    FOREIGN KEY("doctor_id") REFERENCES "doctors"("doctor_id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id")
)

CREATE TABLE "department" (
    "department_id" INTEGER,
    "dep_head" TEXT,
    "dep_name" TEXT NOT NULL,
    "emp_count" INTEGER,
    PRIMARY KEY("department_id")
)

CREATE TABLE "emergency_contact" (
    "patient_id" INTEGER,
    "phone" TEXT NOT NULL,
    "relation" TEXT NOT NULL,
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id")
)

CREATE TABLE "insurance" (
    "policy_number" NUMERIC,
    "patient_id" INTEGER,
    "ins_code" TEXT NOT NULL UNIQUE,
    "end_date" NUMERIC,
    "provider" TEXT NOT NULL,
    "plan" TEXT NOT NULL,
    "co_pay" REAL,
    "coverage" TEXT NOT NULL,
    "maternity" INTEGER NOT NULL CHECK("maternity" IN (0,1)) DEFAULT 0,
    "dental" INTEGER NOT NULL CHECK("dental" IN (0,1)) DEFAULT 0,
    "optical" INTEGER NOT NULL CHECK("optical" IN (0,1)) DEFAULT 0,
    PRIMARY KEY("policy_number"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id")
)

CREATE TABLE "medical_history" (
    "record_id" INTEGER,
    "patient_id" INTEGER,
    "allergies" TEXT,
    "pre_conditions" TEXT,
    PRIMARY KEY("record_id"),
    FOREIGN KEY("patient_id") REFERENCES "patients"("patient_id")
)

CREATE TABLE "payroll" (
    "account_no" INTEGER,
    "emp_id" INTEGER,
    "salary" REAL,
    "bonus" REAL,
    "IBAN" TEXT,
    "payment_date" NUMERIC,
    PRIMARY KEY("account_no"),
    FOREIGN KEY("emp_id") REFERENCES "staff"("emp_id")
)

CREATE INDEX "find_patient_name" ON "patients" ("patient_Fname","patient_Lname");
CREATE INDEX "find_employee_name" ON "staff" ("emp_Fname","emp_Lname");
CREATE INDEX "find_doc_specialization" ON "doctors" ("specialization");
CREATE INDEX "medicine_name" ON "medicine" ("med_name");
CREATE INDEX "department_name" ON "department" ("dep_name");
CREATE INDEX "test_date" ON "lab_screening" ("date");
