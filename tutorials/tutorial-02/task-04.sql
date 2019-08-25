CREATE TABLE STUDENT2 (
    SID NUMBER(6) NOT NULL,
    SLName VARCHAR2(30),
    SFName VARCHAR2(30),
    SGender CHAR(1),
    SDOB DATE,
    SCategory VARCHAR2(6),
    PRIMARY KEY (SID)
)

CREATE TABLE ENROLMENT2 (
    SID NUMBER(6) NOT NULL,
    OID NUMBER(6) NOT NULL,
    Score NUMBER(3),
    Grade VARCHAR2(2),
    PRIMARY KEY (SID, OID)
)


CREATE TABLE SUBJECT2 (
    UCode CHAR(5) NOT NULL,
    UTitle VARCHAR2(30),
    UCredit Number(3),
    PRIMARY KEY (UCode)
)


CREATE TABLE OFFERING2 (
    OID NUMBER(6) NOT NULL,
    OYear
    OSem
    OCampus
    OMode
    UCode
)
