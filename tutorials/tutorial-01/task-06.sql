-- Part A
CREATE TABLE STUDENT (
  StudentNO               NUMBER(6)     NOT NULL,
  DOB                     DATE,
  FName                   VARCHAR2(30),
  LName                   VARCHAR2(30),
  -- city spelt CiTTy
  CiTTy                   VARCHAR2(40),
  PostCode                VARCHAR2(4),
  Country                 VARCHAR2(30),
  FeePaid                 NUMBER(8,2),
  LastFeeDate             DATE,
  PRIMARY KEY(StudentNO)
);

-- Part B
INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (3001, TO_DATE('01-JAN-1990'), 'John', 'Doe', 'Melbourne', 3000, 'Australia', 1000.00, TO_DATE('01-JAN-2019'));
INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (3002, TO_DATE('01-OCT-1990'), 'Emma', 'Doe', 'Melbourne', 3000, 'Australia', 1000.00, TO_DATE('01-JAN-2019'));
INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (3003, TO_DATE('01-SEP-1990'), 'Jane', 'Doe', 'Melbourne', 3000, 'Australia', 1000.00, TO_DATE('01-JAN-2019'));
INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (3004, TO_DATE('01-NOV-1990'), 'Bill', 'Doe', 'Melbourne', 3000, 'Australia', 1000.00, TO_DATE('01-JAN-2019'));
INSERT INTO STUDENT (StudentNO, DOB, FName, LName, CiTTy, PostCode, Country, FeePaid, LastFeeDate)
VALUES (3005, TO_DATE('01-DEC-1990'), 'Adam', 'Doe', 'Melbourne', 3000, 'Australia', 1000.00, TO_DATE('01-JAN-2019'));
