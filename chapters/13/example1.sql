CREATE TABLE [EMPLOYEES_PROJECTS_TIME] (  
    [EmployeeID] INTEGER  NOT NULL PRIMARY KEY,  
    [Name] TEXT NOT NULL,
    [Project] TEXT NOT NULL,
    [Time] TEXT NOT NULL
);  

INSERT INTO EMPLOYEES_PROJECTS_TIME VALUES('EN1-26', "Sean O'Brien", "30-452-T3, 30-457-T3, 32-244-T3", "0.25, 0.40, 0.30");
INSERT INTO EMPLOYEES_PROJECTS_TIME VALUES('EN1-33', "Amy Guya", "30-452-T3, 30-382-TC, 32-244-T3", "0.05, 0.35, 0.60");
INSERT INTO EMPLOYEES_PROJECTS_TIME VALUES('EN1-35', "Steven Baranco", "30-452-T3, 31-238-TC", "0.15, 0.80");
INSERT INTO EMPLOYEES_PROJECTS_TIME VALUES('EN1-36', "Elizabeth Roslyn", "35-152-TC", "0.90");
INSERT INTO EMPLOYEES_PROJECTS_TIME VALUES('EN1-38', "Carol Schaaf", "36-272-TC", "0.75");
INSERT INTO EMPLOYEES_PROJECTS_TIME VALUES('EN1-40', "Alexandra Wing", "31-238-TC, 31-241-TC", "0.20, 0.70");