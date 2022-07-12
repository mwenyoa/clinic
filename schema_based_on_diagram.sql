
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
    medical_histories_id INT REFERENCES medical_histories(id)
  )

  -- INDEXES FOR ALL FOREIGN KEYS
  CREATE INDEX medical_histories_patient_id ON medical_histories(patient_id);

  CREATE INDEX invoices_medical_history_id  ON invoices(medical_history_id);

  CREATE INDEX invoice_items_invoice_id ON invoice_items(invoice_id);

  CREATE INDEX invoice_items_treatment_id ON invoice_items(treatment_id);

  CREATE INDEX medical_histories_treatment_treatment_id ON medical_histories_treatment(treatment_id);

 

  
  