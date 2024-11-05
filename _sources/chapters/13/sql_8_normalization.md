---
jupytext:
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---

# Normalization

Database normalization serves several important purposes. The key objectives and benefits are:

1. **Eliminate Data Redundancy**

   - Without normalization: The same doctor's information is repeated for every patient
   - With normalization: Doctor information is stored once in a Doctors table
   - Benefits: Saves storage space and ensures consistency

2. **Prevent Update Anomalies**

   - Without normalization: Updating a doctor's phone number requires changing multiple patient records
   - With normalization: Update one record in the Doctors table
   - Benefits: Reduces errors and maintains data integrity

3. **Prevent Insert Anomalies**

   - Without normalization: Can't add a new doctor without a patient
   - With normalization: Can add doctors independently in their own table
   - Benefits: Data can be added more flexibly and logically

4. **Prevent Delete Anomalies**

   - Without normalization: Deleting the last patient of a doctor would lose the doctor's information
   - With normalization: Doctor information remains even if all their patients are deleted
   - Benefits: Preserves important data

5. **Ensure Data Consistency**

   - Without normalization: Same data might be entered differently in different places
   - With normalization: Each piece of data has one authoritative source
   - Benefits: Maintains data quality and reliability

6. **Better Data Organization**

   - Without normalization: Data is mixed together (like medical history with insurance info)
   - With normalization: Data is organized by logical entities (patients, doctors, insurance, etc.)
   - Benefits: Easier to understand and maintain

7. **More Flexible Querying**

   - Without normalization: Complex queries might be difficult or impossible
   - With normalization: Can join tables in various ways to get needed information
   - Benefits: Better reporting and analysis capabilities

8. **Easier Maintenance**

   - Without normalization: Changes to data structure affect many parts of the database
   - With normalization: Changes are localized to specific tables
   - Benefits: Reduces maintenance effort and risk

9. **Better Data Integrity**

   - Without normalization: Difficult to enforce relationships and constraints
   - With normalization: Can use foreign keys and constraints effectively
   - Benefits: Ensures data accuracy and reliability

10. **Reduced Data Modification Issues**
    - Without normalization: Changes could have unintended consequences
    - With normalization: Changes are isolated and controlled
    - Benefits: Safer database updates

In our patient database example:

```sql
# Before normalization:
Patients (
    PatientID,
    PatientName,
    DoctorName,      # Repeated for many patients
    DoctorPhone,     # Repeated for many patients
    DoctorSpecialty  # Repeated for many patients
)

# After normalization:
Patients (
    PatientID,
    PatientName,
    DoctorID         # Reference to Doctors table
)

Doctors (
    DoctorID,
    DoctorName,      # Stored once
    DoctorPhone,     # Stored once
    DoctorSpecialty  # Stored once
)
```

The trade-offs of normalization include:

1. More complex queries requiring joins
2. Potentially slower query performance for some operations
3. More tables to manage
4. More complex relationships to maintain

However, these drawbacks are usually outweighed by the benefits in most business applications where data integrity is crucial, like healthcare systems.

## The Five Normal Forms

- The five normal forms of database normalization, progressing from 1NF to 5NF, with clear examples from our patient database context.

1. **First Normal Form (1NF)**

   - Rules:
     - Each cell contains a single value (atomic)
     - No repeating groups or arrays
     - Each record is unique
   - Example:

     ```sql
     # Before 1NF
     Patient {
         PatientID: 1,
         Medications: "Aspirin, Ibuprofen, Paracetamol",
         Allergies: ["Penicillin", "Peanuts"]
     }

     # After 1NF
     PatientMedications {
         PatientID: 1,
         MedicationName: "Aspirin"
     }
     PatientMedications {
         PatientID: 1,
         MedicationName: "Ibuprofen"
     }
     ```

2. **Second Normal Form (2NF)**

   - Rules:
     - Must be in 1NF
     - No partial dependencies (non-key attributes must depend on entire primary key)
   - Example:

     ```sql
     # Before 2NF
     PatientMedication {
         PatientID + MedicationID (composite key),
         MedicationName,        # Depends only on MedicationID
         PatientName,           # Depends only on PatientID
         Dosage                 # Depends on both (OK)
     }

     # After 2NF
     Medications {
         MedicationID,
         MedicationName
     }
     PatientMedications {
         PatientID,
         MedicationID,
         Dosage
     }
     ```

3. **Third Normal Form (3NF)**

   - Rules:
     - Must be in 2NF
     - No transitive dependencies (non-key attributes can't depend on other non-key attributes)
   - Example:

     ```sql
     # Before 3NF
     Patient {
         PatientID,
         Address,
         City,            # Depends on Address, not PatientID
         State,           # Depends on Address, not PatientID
         ZipCode          # Depends on Address, not PatientID
     }

     # After 3NF
     Patient {
         PatientID,
         AddressID
     }
     Address {
         AddressID,
         Address,
         City,
         State,
         ZipCode
     }
     ```

4. **Boyce-Codd Normal Form (BCNF)**

   - Rules:
     - Must be in 3NF
     - For every dependency A → B, A must be a superkey
   - Example:

     ```sql
     # Before BCNF
     DoctorSchedule {
         Doctor,
         Specialty,
         TimeSlot,
         Room        # Room depends on TimeSlot, but TimeSlot isn't a key
     }

     # After BCNF
     DoctorSpecialty {
         Doctor,
         Specialty
     }
     RoomSchedule {
         TimeSlot,
         Room
     }
     DoctorAssignment {
         Doctor,
         TimeSlot
     }
     ```

5. **Fifth Normal Form (5NF)**

   - Rules:
     - Must be in BCNF
     - No join dependencies that don't follow from the key constraints
   - Example:

     ```sql

     # Before 5NF
     DoctorPatientInsurance {
         DoctorID,
         PatientID,
         InsuranceID
     }

     # After 5NF
     DoctorPatient {
         DoctorID,
         PatientID
     }
     PatientInsurance {
         PatientID,
         InsuranceID
     }
     DoctorInsurance {
         DoctorID,
         InsuranceID
     }
     ```

Key Points:

1. Each form builds on the previous one
2. Higher normal forms reduce redundancy but increase complexity
3. Most real-world applications aim for 3NF
4. BCNF and 5NF are rarely implemented fully
5. Sometimes denormalization is done for performance

Common Stopping Points:

- Most systems stop at 3NF
- Healthcare systems often aim for BCNF due to data integrity requirements
- 5NF is rarely implemented in practice
- Sometimes partial denormalization is done for performance reasons

Practical Considerations:

1. Each higher form:

   - Reduces redundancy
   - Increases number of tables
   - Makes queries more complex
   - Requires more joins

2. Trade-offs between:
   - Data integrity
   - Query performance
   - System complexity
   - Maintenance effort

## Patient Database Normalization Example

### Non-Normalized Form

```sql
CREATE TABLE Patients (
    PatientID INT,
    PatientName TEXT,
    DateOfBirth DATE,
    Address TEXT,
    Phone TEXT,
    PrimaryDoctor TEXT,
    DoctorPhone TEXT,
    DoctorSpecialty TEXT,
    Appointments TEXT,  -- Contains multiple appointment dates and times
    Medications TEXT,   -- Contains multiple medication names and dosages
    AllergiesList TEXT, -- Contains multiple allergies
    EmergencyContact TEXT,
    EmergencyPhone TEXT,
    EmergencyRelation TEXT,
    InsuranceProvider TEXT,
    InsurancePolicyNumber TEXT,
    InsuranceGroupNumber TEXT
);
```

#### Issues with Non-Normalized Form:

- Data redundancy: Doctor information repeated for each patient with the same doctor
- Multiple values in single columns (Appointments, Medications, Allergies)
- Update anomalies: Changing a doctor's phone requires updating multiple rows
- Delete anomalies: Deleting a patient could lose doctor information
- Insert anomalies: Cannot add a new doctor without a patient

### First Normal Form (1NF)

```sql
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName TEXT,
    DateOfBirth DATE,
    Address TEXT,
    Phone TEXT,
    PrimaryDoctorID INT,
    EmergencyContactID INT,
    InsuranceID INT
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    DoctorName TEXT,
    Phone TEXT,
    Specialty TEXT
);

CREATE TABLE EmergencyContacts (
    ContactID INT PRIMARY KEY,
    ContactName TEXT,
    Phone TEXT,
    Relation TEXT
);

CREATE TABLE Insurance (
    InsuranceID INT PRIMARY KEY,
    Provider TEXT,
    PolicyNumber TEXT,
    GroupNumber TEXT
);

CREATE TABLE PatientAppointments (
    AppointmentID INT PRIMARY KEY,
    PatientID INT,
    AppointmentDateTime DATETIME,
    Purpose TEXT
);

CREATE TABLE PatientMedications (
    MedicationID INT PRIMARY KEY,
    PatientID INT,
    MedicationName TEXT,
    Dosage TEXT,
    Frequency TEXT
);

CREATE TABLE PatientAllergies (
    AllergyID INT PRIMARY KEY,
    PatientID INT,
    Allergy TEXT,
    Severity TEXT
);
```

#### Benefits of 1NF:

- No repeating groups or arrays
- Each cell contains a single value
- Each record has a unique identifier
- Data is atomic (cannot be broken down further)

### Second Normal Form (2NF)

```sql
-- Previous tables remain the same, but add:

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName TEXT,
    Description TEXT,
    StandardDosage TEXT
);

CREATE TABLE PatientMedications (
    PrescriptionID INT PRIMARY KEY,
    PatientID INT,
    MedicationID INT,
    Dosage TEXT,
    Frequency TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID)
);

CREATE TABLE Allergies (
    AllergyID INT PRIMARY KEY,
    AllergyName TEXT,
    Description TEXT
);

CREATE TABLE PatientAllergies (
    PatientAllergyID INT PRIMARY KEY,
    PatientID INT,
    AllergyID INT,
    Severity TEXT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (AllergyID) REFERENCES Allergies(AllergyID)
);
```

#### Benefits of 2NF

- Removes partial dependencies
- Reduces data redundancy
- Medication and allergy information stored once, referenced many times
- Consistent data across all patient records
- Easier maintenance of standard medical information

### Third Normal Form (3NF)

```sql
-- Previous tables remain, but add:

CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    Street TEXT,
    City TEXT,
    State TEXT,
    ZipCode TEXT,
    Country TEXT
);

-- Modify Patients table:
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName TEXT,
    DateOfBirth DATE,
    AddressID INT,
    Phone TEXT,
    PrimaryDoctorID INT,
    EmergencyContactID INT,
    InsuranceID INT,
    FOREIGN KEY (AddressID) REFERENCES Addresses(AddressID),
    FOREIGN KEY (PrimaryDoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (EmergencyContactID) REFERENCES EmergencyContacts(ContactID),
    FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID)
);

CREATE TABLE InsurancePlans (
    PlanID INT PRIMARY KEY,
    InsuranceID INT,
    PlanName TEXT,
    Coverage TEXT,
    FOREIGN KEY (InsuranceID) REFERENCES Insurance(InsuranceID)
);
```

#### Benefits of 3NF

- Eliminates transitive dependencies
- Address information stored once and referenced
- Insurance plan details separated from basic insurance information
- Reduced redundancy in address storage
- Easier to update address information for multiple patients
- Facilitates address validation and standardization

#### More on Transitive Dependency

Looking at the patient database example, we can identify the transitive dependencies that existed and how we resolved them in 3NF.

A clear example of transitive dependency in our patient database was:

1. `PatientID` → `DoctorID` → `DoctorSpecialty`
   - A patient is assigned to a doctor (DoctorID)
   - The doctor's specialty depends on the DoctorID, not the PatientID
   - In the non-normalized form, we stored specialty with each patient, creating redundancy

Here's another example: 2. `PatientID` → `AddressID` → `City/State/Zip`

- A patient has an address (AddressID)
- The city, state, and zip depend on the address, not directly on the patient

Let's see this in the actual tables:

Non-normalized version (with transitive dependency):

```sql
CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY,
    PatientName TEXT,
    Address TEXT,          -- Contains full address including city/state/zip
    PrimaryDoctor TEXT,    -- Contains doctor name
    DoctorSpecialty TEXT,  -- This is transitively dependent on DoctorID!
    -- other fields...
)
```

3NF version (resolved transitive dependencies):

```sql
CREATE TABLE Patients (
    PatientID INTEGER PRIMARY KEY,
    PatientName TEXT,
    AddressID INTEGER,     -- Reference to Addresses table
    PrimaryDoctorID INTEGER,  -- Reference to Doctors table
    -- other fields...
)

CREATE TABLE Doctors (
    DoctorID INTEGER PRIMARY KEY,
    DoctorName TEXT,
    Specialty TEXT         -- Now directly dependent on DoctorID
)

CREATE TABLE Addresses (
    AddressID INTEGER PRIMARY KEY,
    Street TEXT,
    City TEXT,            -- Now directly dependent on AddressID
    State TEXT,           -- Now directly dependent on AddressID
    ZipCode TEXT          -- Now directly dependent on AddressID
)
```

Other transitive dependencies we resolved included: 3. `PatientID` → `InsuranceID` → `PlanDetails`

- Plan details depend on the insurance ID, not the patient ID
- Resolved by creating the InsurancePlans table

4. `PatientID` → `MedicationID` → `StandardDosage`
   - Standard dosage depends on the medication, not the patient
   - Resolved by separating standard medication information into the Medications table

The benefits of removing these dependencies in our patient database include:

1. If a doctor changes their specialty, we only update one record in the Doctors table
2. If a zip code changes for an address, we only update one record in the Addresses table
3. Standard medication information is stored once, not repeated for each prescription
4. Insurance plan details are maintained separately from individual patient policies

### Summary of Benefits

1. **Non-Normalized to 1NF:**

   - Eliminates repeating groups
   - Makes data atomic
   - Establishes unique identifiers
   - Enables basic data integrity

2. **1NF to 2NF:**

   - Reduces redundancy in medical reference data
   - Improves data consistency
   - Makes updating standard medical information easier
   - Enables better medication and allergy tracking

3. **2NF to 3NF:**
   - Further reduces data redundancy
   - Improves data integrity
   - Makes address and insurance management more efficient
   - Reduces storage requirements
   - Simplifies data updates
