alter session set "_ORACLE_SCRIPT"=true;  

CREATE TABLE C##dev.EmployeeRole (
    RoleID INT NOT NULL PRIMARY KEY,
    RoleName VARCHAR(55) NOT NULL
)

CREATE TABLE C##dev.EmployeeType (
    EmployeeTypeID INT NOT NULL PRIMARY KEY,
    EmployeeTypeName VARCHAR(55) NOT NULL,
    EmployeeTypeDescription VARCHAR(1000) NOT NULL
)

CREATE TABLE C##dev.HistoryType (
    HistoryTypeID INT NOT NULL PRIMARY KEY,
    HistoryTypeDescription VARCHAR(255) NOT NULL
)

CREATE TABLE C##dev.TaskType (
    TaskTypeID INT NOT NULL PRIMARY KEY,
    TaskTypeDescription VARCHAR(255) NOT NULL
)

CREATE TABLE C##dev.Task (
    TaskID INT NOT NULL PRIMARY KEY,
    TaskTypeID INT NOT NULL,
    TaskName VARCHAR(255) NOT NULL,
    TaskDescription VARCHAR(3000) NOT NULL,
    DateFinish DATE NOT NULL,
    FOREIGN KEY (TaskTypeID) REFERENCES C##dev.TaskType(TaskTypeID)
)

CREATE TABLE C##dev.Investor (
    InvestorID INT NOT NULL PRIMARY KEY,
    InvestorFirstName VARCHAR(255) NOT NULL,
    InvestorSecondName VARCHAR(255) NOT NULL,
    InvestorContactInformation VARCHAR(3000) NOT NULL
)

CREATE TABLE C##dev.Company (
    CompanyID INT NOT NULL PRIMARY KEY,
    CompanyName VARCHAR(255) NOT NULL,
    CompanyDescription VARCHAR(3000) NOT NULL,
    CompanyAddress VARCHAR (1000) NOT NULL,
    CompanyContactInformation VARCHAR (1000) NOT NULL
)

CREATE TABLE C##dev.Investment (
    InvestmentID INT NOT NULL PRIMARY KEY,
    CompanyID INT NOT NULL,
    InvestorID INT NOT NULL,
    InvestmentSum INT NOT NULL,
    FOREIGN KEY (CompanyID) REFERENCES C##dev.Company(CompanyID),
    FOREIGN KEY (InvestorID) REFERENCES C##dev.Investor(InvestorID)
)

CREATE TABLE C##dev.Department (
    DepartmentID INT NOT NULL PRIMARY KEY,
    CompanyID INT NOT NULL,
    DepartmentName VARCHAR(255) NOT NULL,
    DepartmentDescription VARCHAR(3000) NOT NULL,
    FOREIGN KEY (CompanyID) REFERENCES C##dev.Company(CompanyID)
)

CREATE TABLE C##dev.Client (
    ClientID INT NOT NULL PRIMARY KEY,
    ClientName VARCHAR(255) NOT NULL,
    ClientContactInformation VARCHAR(3000) NOT NULL
)

CREATE TABLE C##dev.OrderClient (
    OrderClientID INT NOT NULL PRIMARY KEY,
    ProjectID INT NOT NULL,
    CLientID INT NOT NULL,
    OrderClientName VARCHAR(255) NOT NULL,
    OrderClientDescription VARCHAR(3000) NOT NULL,
    OrderClientPrice INT NOT NULL,
    OrderClientDate DATE NOT NULL,
    FOREIGN KEY (CLientID) REFERENCES C##dev.CLient(CLientID)
)

CREATE TABLE C##dev.Project (
    ProjectID INT NOT NULL PRIMARY KEY,
    CompanyID INT NOT NULL,
    CLientID INT NOT NULL,
    ProjectName VARCHAR(255) NOT NULL,
    ProjectDescription VARCHAR(3000) NOT NULL,
    DateStart DATE NOT NULL,
    DateFinish DATE NOT NULL,
    FOREIGN KEY (CompanyID) REFERENCES C##dev.Company(CompanyID),
    FOREIGN KEY (CLientID) REFERENCES C##dev.CLient(CLientID)
)

//ALTER TABLE OrderClient
//ADD FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID);

CREATE TABLE C##dev.Employee (
    EmployeeID INT NOT NULL PRIMARY KEY,
    EmployeeTypeID INT NOT NULL,
    EmployeeRoleID INT NOT NULL,
    DepartmentID INT NOT NULL,
    CompanyID INT NOT NULL,
    EmployeeFirstName VARCHAR(255) NOT NULL,
    EmployeeSecondName VARCHAR(255) NOT NULL,
    EmployeeSalary INT NOT NULL,
    EmployeeContactInformation VARCHAR(3000) NOT NULL,
    Login VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
    FOREIGN KEY (EmployeeTypeID) REFERENCES C##dev.EmployeeType(EmployeeTypeID),
    FOREIGN KEY (EmployeeRoleID) REFERENCES C##dev.EmployeeRole(RoleID),
    FOREIGN KEY (CompanyID) REFERENCES C##dev.Company(CompanyID),
    FOREIGN KEY (DepartmentID) REFERENCES C##dev.Department(DepartmentID)
)

CREATE TABLE C##dev.EmployeeTask (
    EmployeeID INT NOT NULL,
    TaskID INT NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES C##dev.Employee(EmployeeID),
    FOREIGN KEY (TaskID) REFERENCES C##dev.Task(TaskID),
    PRIMARY KEY (EmployeeID, TaskID)
)

CREATE TABLE C##dev.EmployeeTaskHistory (
    HistoryID INT NOT NULL PRIMARY KEY,
    EmployeeID INT NOT NULL,
    TaskID INT NOT NULL,
    HistoryTypeID INT NOT NULL,
    FOREIGN KEY (TaskID) REFERENCES C##dev.Task(TaskID),
    FOREIGN KEY (EmployeeID) REFERENCES C##dev.Employee(EmployeeID),
    FOREIGN KEY (HistoryTypeID) REFERENCES C##dev.HistoryType(HistoryTypeID)
)

create table C##dev.MyTable
(
    id number(10) GENERATED BY DEFAULT ON NULL AS IDENTITY,
    val number(10),
    CONSTRAINT id_pk PRIMARY KEY (id)
)

create or replace procedure C##dev.updateMyTable
    ( mod_id in number, new_val in number )
is
begin
    update C##dev.MyTable set val=new_val where id = mod_id;
end;

create or replace procedure C##dev.deleteMyTable
    ( del_id in number )
is
begin
    delete from C##dev.MyTable where id=del_id;
end;



create or replace function C##dev.getReward1(salary in number, percent in number)
return double precision
is
    ret double precision;
begin
    if (salary < 0) then
        raise_application_error(-20001, 'Salary cannot be negative.');
    end if;
    
    if (percent < 0) then
        raise_application_error(-20001, 'Percent cannot be negative.');
    end if;
    
    ret := ( 1 + percent ) * 12 * salary;
    
    return ret;
end;

CREATE unique INDEX C##dev.indx_client_name ON C##dev.Client(ClientName);
CREATE unique INDEX C##dev.indx_company_name ON C##dev.Company(lower(CompanyName));

create table C##dev.tst_c1(id number primary key, id1 number);
create table C##dev.tst_c2(id number primary key, id2 number, FOREIGN KEY (id2) REFERENCES C##dev.tst_c1(id));

ALTER TABLE C##dev.tst_c1 ADD CONSTRAINT fk_c2_id FOREIGN KEY (id1) REFERENCES C##dev.tst_c2(id);
-- alter table dev.tst_c1 drop CONSTRAINT fk_c2_id


CREATE OR REPLACE PROCEDURE C##dev.my_procedure AS
  v_variable VARCHAR2(100);
BEGIN
  -- ����������� ���������� �������� "������ ���������"
  v_variable := '������ ���������';
  DBMS_OUTPUT.PUT_LINE('�������� ���������� � ������ ���������: ' || v_variable);
END my_procedure;




