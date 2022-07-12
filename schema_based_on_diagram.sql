
-- CREATE DATABASE

CREATE DATABASE clinic;

-- CREATE PATIENTS TABLE
CREATE TABLE patients(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE
);

-- CREATE TABLE MEDICAL HISTORIES
CREATE TABLE medical_histories(
 id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
 admitted_at TIMESTAMP, 
 patient_id INT  REFERENCES patients(id)
);

-- CREATE TABLE INVOICES
  CREATE TABLE invoices(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP, 
  payed_at TIMESTAMP, 
  medical_history_id INT  REFERENCES medical_histories(id)
  );

-- CREATE TABLE TREATMENTS
  CREATE TABLE treatments(
  id INT  medical_histories(id) PRIMARY KEY,
  type VARCHAR,
  name VARCHAR
  );

  -- CREATE TABLE INVOICE_ITEMS
  CREATE TABLE invoice_items(
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT, 
  invoice_id INT  REFERENCES invoices(id),
  treatment_id INT  REFERENCES treatments(id)
  );


  -- CREATE JOIN TABLE BETWEEN MEDICAL HISTORY AND TREATMENTS
  CREATE TABLE medical_histories_treatment (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    treatment_id INT  REFERENCES treatments(id), 
    id INT REFERENCES medical_histories(id)
  )