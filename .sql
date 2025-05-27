 CREATE DATABASE bankmanagmentsystem;
USE bankmanagmentsystem;
CREATE TABLE customer (
    customerid INT PRIMARY KEY,
    customerCNIC VARCHAR(15),
    customername VARCHAR(30),
    customeremail VARCHAR(50),
    customeraddress VARCHAR(30)
);
CREATE TABLE branch (
    branchid INT PRIMARY KEY,
    branchaddress VARCHAR(50),
    branchEmail VARCHAR(50),
    branchname VARCHAR(40)
);
CREATE TABLE employee (
    managerid INT PRIMARY KEY,
    managername VARCHAR(50),
    joiningdate DATE,
    position VARCHAR(50),
    branchid INT,
    FOREIGN KEY (branchid) REFERENCES branch(branchid)
);
ALTER TABLE branch
ADD managerid INT,
ADD FOREIGN KEY (managerid) REFERENCES employee(managerid);
CREATE TABLE Accounts (
    Accountid INT PRIMARY KEY,
    Accountname VARCHAR(30),
    Accounttype VARCHAR(15),
    customerid INT,
    branchid INT,
    FOREIGN KEY (customerid) REFERENCES customer(customerid),
    FOREIGN KEY (branchid) REFERENCES branch(branchid)
);
CREATE TABLE loan (
    loanid INT PRIMARY KEY,
    loanAmount VARCHAR(50),
    loanstatus VARCHAR(30),
    branchid INT,
    customerid INT,
    FOREIGN KEY (branchid) REFERENCES branch(branchid),
    FOREIGN KEY (customerid) REFERENCES customer(customerid)
);
CREATE TABLE transactions (
    transactionid INT PRIMARY KEY,
    Amount VARCHAR(30),
    transactiondate DATE,
    customerid INT,
    Accountid INT,
    FOREIGN KEY (customerid) REFERENCES customer(customerid),
    FOREIGN KEY (Accountid) REFERENCES Accounts(Accountid)
);
CREATE TABLE customerservice (
    serviceid INT PRIMARY KEY,
    servicename VARCHAR(50),
    descriptions VARCHAR(250),
    servicetype VARCHAR(30)
);
CREATE TABLE customer_service_relation (
    customerid INT,
    serviceid INT,
    PRIMARY KEY (customerid, serviceid),
    FOREIGN KEY (customerid) REFERENCES customer(customerid),
    FOREIGN KEY (serviceid) REFERENCES customerservice(serviceid)
);
INSERT INTO customer (customerid, customerCNIC, customername, customeremail, customeraddress)
VALUES
(1, '12345-6789012-3', 'Ali Khan', 'ali.khan@example.com', 'Lahore'),
(2, '23456-7890123-4', 'Sara Ahmed', 'sara.ahmed@example.com', 'Karachi'),
(3, '34567-8901234-5', 'John Raza', 'john.raza@example.com', 'Islamabad');
INSERT INTO branch (branchid, branchaddress, branchEmail, branchname)
VALUES
(1, 'Gulberg, Lahore', 'gulberg@bank.com', 'Gulberg Branch'),
(2, 'Clifton, Karachi', 'clifton@bank.com', 'Clifton Branch');
INSERT INTO employee (managerid, managername, joiningdate, position, branchid)
VALUES
(100, 'Mr. Usman', '2022-01-01', 'Branch Manager', 1),
(101, 'Ms. Fatima', '2021-05-10', 'Branch Manager', 2);
INSERT INTO Accounts (Accountid, Accountname, Accounttype, customerid, branchid)
VALUES
(201, 'Ali Savings', 'Savings', 1, 1),
(202, 'Sara Checking', 'Current', 2, 2),
(203, 'John Business', 'Business', 3, 1);
INSERT INTO loan (loanid, loanAmount, loanstatus, branchid, customerid)
VALUES
(301, '500000', 'Approved', 1, 1),
(302, '750000', 'Pending', 2, 2),
(303, '1000000', 'Approved', 1, 3);
INSERT INTO transactions (transactionid, Amount, transactiondate, customerid, Accountid)
VALUES
(401, '25000', '2024-03-15', 1, 201),
(402, '15000', '2024-04-01', 2, 202),
(403, '50000', '2024-05-10', 3, 203);
INSERT INTO customerservice (serviceid, servicename, descriptions, servicetype)
VALUES
(501, 'Online Banking', 'Access account via internet', 'Digital'),
(502, 'Loan Consultation', 'Discuss loan options with advisor', 'Support'),
(503, 'ATM Services', 'Withdraw/deposit using ATM', 'Automated');
INSERT INTO customer_service_relation (customerid, serviceid)
VALUES
(1, 501), (1, 503),
(2, 501), (2, 502),
(3, 502), (3, 503);
 









 
 
 
 
 
 
 