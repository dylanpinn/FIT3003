-- DW Option 1 - using a bridge table.

-- a. Create a dimension table called TruckDim1
CREATE TABLE TruckDim1 (
  TruckID         VARCHAR2(10) NOT NULL,
  VolCapacity     NUMBER(5,2),
  WeightCategory  VARCHAR2(10),
  CostPerKm       NUMBER(5,2),

  PRIMARY KEY (TruckID)
);

INSERT INTO TruckDim1
SELECT * FROM Truck;

-- b. Create a dimension table called TripSeason1. This table will have 4
-- records (Summer, Autumn, Winter, and Spring).
CREATE TABLE TripSeason1 (
  SeasonID VARCHAR2(10) NOT NULL,
  SeasonPeriod VARCHAR2(50),

  PRIMARY KEY (SeasonID)
);

INSERT INTO TripSeason1 VALUES (1, 'Summer');
INSERT INTO TripSeason1 VALUES (2, 'Autumn');
INSERT INTO TripSeason1 VALUES (3, 'Winter');
INSERT INTO TripSeason1 VALUES (4, 'Spring');

-- c. Create a dimension table called TripDim1.
CREATE TABLE TripDim1 (
  TripID    VARCHAR2(10) NOT NULL,
  TripDate      DATE,
  TotalKm   NUMBER(5),

  PRIMARY KEY (TripID)
);

INSERT INTO TripDim1
SELECT TripID, TripDate, TotalKm
FROM Trip;

-- d. Create a bridge table called BridgeTableDim1.
CREATE TABLE BridgeTableDim1 (
  TripID    VARCHAR2(10) NOT NULL,
  StoreID   VARCHAR2(10) NOT NULL,

  PRIMARY KEY (TripID, StoreID),
  FOREIGN KEY (TripID) REFERENCES TripDim1(TripID)
);

-- e. Create a dimension table called StoreDim1.
CREATE TABLE StoreDim1 (
  StoreID     VARCHAR2(10) NOT NULL,
  StoreName   VARCHAR2(10),
  Address     VARCHAR2(20),

  PRIMARY KEY (StoreID)
);

ALTER TABLE BridgeTableDim1
  ADD CONSTRAINT bridge_store_fk
  FOREIGN KEY (StoreID)
  REFERENCES StoreDim1(StoreID);

INSERT INTO StoreDim1
SELECT StoreID, StoreName, StoreAddress AS Address
FROM Store;

INSERT INTO BridgeTableDim1
SELECT TripID, StoreID
FROM Destination;

-- f. Create a tempfact (and perform the necessary alter and update), and then
-- create the final fact table (called it TruckFact1).
CREATE TABLE TruckFact1 (
  TruckID             VARCHAR2(10) NOT NULL,
  SeasonID            VARCHAR2(10) NOT NULL,
  TripID              VARCHAR2(10) NOT NULL,
  TotalDeliveryCost   NUMBER(5,2),

  PRIMARY KEY (TruckID, SeasonID, TripID),
  FOREIGN KEY (TruckID) REFERENCES TruckDim1(TruckID),
  FOREIGN KEY (SeasonID) REFERENCES TripSeason1(SeasonID),
  FOREIGN KEY (TripID) REFERENCES TripDim1(TripID)
);

/* INSERT INTO TruckFact1 */
/* SELECT */
