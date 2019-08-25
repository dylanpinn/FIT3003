CREATE TABLE LECTURER (
  StaffNO       NUMBER(6)       NOT NULL,
  Title         VARCHAR2(3),
  FName         VARCHAR2(30),
  LName         VARCHAR2(30),
  StreetAddress VARCHAR2(70),
  Suburb        VARCHAR2(40),
  City          VARCHAR2(40),
  PostCode      VARCHAR2(4),
  Country       VARCHAR2(30),
  LecturerLevel CHAR(2),
  BankNO        CHAR(20),
  BankName      VARCHAR2(40),
  Salary        NUMBER(8,2),
  WorkLoad      NUMBER(2,1)     NOT NULL,
  ResearchArea  VARCHAR2(40),
  PRIMARY KEY(StaffNO)
);
