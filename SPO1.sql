CREATE OR REPLACE PROCEDURE AddEmployee(
    FirstName VARCHAR,
    LastName VARCHAR,
    DepartmentID INT
)
LANGUAGE plpgsql AS $$
BEGIN
    INSERT INTO Employees (FirstName, LastName, DepartmentID)
    VALUES (FirstName, LastName, DepartmentID);
END;
$$;

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DepartmentID INT
);
