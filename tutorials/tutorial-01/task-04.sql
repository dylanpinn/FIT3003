-- Part a
INSERT INTO LECTURER (StaffNO, Title, FName, LName, StreetAddress, Suburb,City, PostCode, Country, LecturerLevel, BankNO, BankName, Salary, WorkLoad, ResearchArea)
VALUES (1000,'Dr','David','Taniar','3 Robinson Av', 'Kew', 'Melbourne', '3080', 'Australia', '5', '1000567237', 'CommBank', 89000.00, 2.0, 'O-R DB');

-- Part b
INSERT INTO LECTURER (StaffNO, Title, FName, LName, StreetAddress, Suburb, City, PostCode, Country, LecturerLevel, BankNO, BankName, Salary, WorkLoad, ResearchArea)
VALUES (2000,'Ms','Julie','Main','6 Algorithm Av', 'Montmorency', 'Melbourne', '3089', 'Australia', '5', '1000123456', 'CommBank', 89000.00, 2.0, 'CBR');

-- Duplicate primary key

-- Part c
INSERT INTO LECTURER VALUES (3000, 'Mr', 'Daniel', 'Wright', '22 Crystal Cres', 'Alphington', 'Melbourne', '3790', 'Australia', '5', '1000654321', 'CommBank', 89000.00, 2.0, 'DB');

-- Part d
INSERT INTO LECTURER (StaffNO, Title, FName, LName, StreetAddress, Suburb, PostCode, Country, ResearchArea, Workload)
VALUES (4000, 'Mr', 'RaiHong', 'Lam', '12 Oracle Dr', 'Fitzroy', '3424', 'Australia', 'Data Mining', 1);
