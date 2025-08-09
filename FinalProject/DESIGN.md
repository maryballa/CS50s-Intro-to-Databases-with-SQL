## Scope

This is a database in SQL for a Public Hospital Management System designed to store, manage, and retrieve essential
data related to hospital operations. It includes relational tables for patients, doctors, staff, appointments, treatments, billing and medicine. The tables are the following:

* Patients, including personal information
* Rooms
* Doctors
* Medicine
* Prescription, which includes information about the medicine, dosage and the date it was prescribed
* Lab screening
* Nurses
* Staff, including personal information about the employees, the date of joining and leaving a department
* Department
* Appointment
* Emergency contact, a patient's emergency contact and the relation to them
* Insurance, including the insurance provider, policy number, coverage details and validity period
* Payroll, which includes employees' payment information


## Functional Requirements

This database will support:

* CRUD operations
* Tracking all patients and employees, room availability, appointments, medication and prescriptions, lab tests,
  expenses for patients' care
* Register and maintain patient information for staff to access and update the information when needed


### Relationships

As detailed by the diagram:

* A patient is assigned to one and only one room. A room can have zero or many patients.
* A patient can have zero to many insurance policies. An insurance policy must be associated with only one patient.
* A patient can have zero or many lab tests. A record of a lab test must be associated with only one patient.
* A patient may have zero or many nusrses. A nurse is taking care of one or many patients.
* A patient can have one or many prescriptions. A prescription is prescribed to one and only one patient.
* A patient has one medical history record. A medical history record is related to one patient.
* A patient has zero or many emergency contacts. An emergency contact is related to one patient.
* A patient can have zero or many appointments. An appointment must be linked to one patient.
* A staff record must be associated with only one nurse. A nurse has only one staff record.
* A staff record must be associated with only one doctor. A doctor has only one staff record.
* A staff member must work for one department. A department can have many staff members.
* A staff record is associated with only one payroll. A payroll must have one record under staff.
* A doctor can have one to many appointments. An appointment is associated with one and only one doctor.
* A prescription can have one or many medicine. A medicine is prescribed to one or many prescriptions.


## Optimizations

Indexes are created on the columns that are more used in queries like patient's name, employee's name, doctors' specialization,
medicine name etc. (`patient_Fname`, `patient_Lname`, `med_name` etc.) Some of these queries are in the file `queries.sql`.

