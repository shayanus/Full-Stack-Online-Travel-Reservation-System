LOCK TABLES `user` WRITE;
INSERT INTO `user` VALUES
('admin1', 'admin1_password', 'SiteAdmin'), 
('admin2', 'admin2_password', 'SiteAdmin'), 
('user1', 'user1_password', 'Customer'), 
('user2', 'user2_password', 'Customer'), 
('user3', 'user3_password', 'Customer'), 
('rep1', 'rep1_password', 'CustomerRepresentative'), 
('rep2', 'rep2_password', 'CustomerRepresentative');
UNLOCK TABLES;


LOCK TABLES `aircraft` WRITE;
INSERT INTO `aircraft` VALUES 
    ('A001', 150, 'Monday,Wednesday,Friday'),
    ('A002', 200, 'Tuesday,Thursday,Saturday,Sunday'),
    ( 'A003', 180, 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday' ),
    ('A004', 160, 'Monday,Thursday,Saturday'),
    ('A005', 190, 'Tuesday,Friday,Sunday'),
    ( 'A006', 170, 'Monday,Tuesday,Thursday,Saturday,Sunday' ),
    ('A007', 220, 'Wednesday,Saturday,Sunday'),
    ('A008', 140, 'Tuesday,Wednesday,Friday,Saturday'),
    ('A009', 210, 'Monday,Wednesday,Saturday,Sunday'),
    ('A010', 180, 'Tuesday,Thursday,Sunday'),
    ('A011', 150, 'Monday,Wednesday,Friday,Saturday'),
    ('A012', 190, 'Tuesday,Thursday,Sunday'),
    ('A013', 180, 'Monday,Wednesday,Saturday,Sunday'),
    ('A014', 170, 'Tuesday,Thursday,Friday,Sunday'),
    ('A015', 200, 'Monday,Wednesday,Friday,Sunday');
UNLOCK TABLES;


LOCK TABLES `airlinecompany` WRITE;
INSERT INTO `airlinecompany` VALUES ('AA'),('AF'),('BA'),('DL'),('EK'),('LH'),('QF'),('SQ'),('UA');
UNLOCK TABLES;


LOCK TABLES `airport` WRITE;
INSERT INTO `airport` VALUES ('AMD'),('AMS'),('ARN'),('ATL'),('AUH'),('BCN'),('BLR'),('BOM'),('BOS'),('BWI'),('CAN'),('CCU'),('CDG'),('CLT'),('COK'),('CPH'),('CTU'),('DCA'),('DEL'),('DEN'),('DFW'),('DMM'),('DOH'),('DTW'),('DUB'),('DXB'),('EWR'),('FCO'),('FLL'),('FRA'),('GOI'),('HEL'),('HKG'),('HNL'),('HYD'),('IAD'),('IAH'),('IST'),('JED'),('JFK'),('KMG'),('LAS'),('LAX'),('LGA'),('LHR'),('MAA'),('MAD'),('MCO'),('MDW'),('MIA'),('MSP'),('MUC'),('ORD'),('OSL'),('PDX'),('PEK'),('PHX'),('PNQ'),('PVG'),('RUH'),('SAN'),('SEA'),('SFO'),('SHA'),('SLC'),('SVO'),('SZX'),('TPA'),('XIY'),('ZRH');
UNLOCK TABLES;


LOCK TABLES `account` WRITE;
INSERT INTO `account` VALUES ('user1','password',NULL),('user2','password',NULL),('user3','password',NULL);
UNLOCK TABLES;


LOCK TABLES `faq` WRITE;
INSERT INTO `faq` VALUES (2,'How do I make a booking?','Use the search page to look for your desired flight. There should be a book now button next to the flight which will take you to the booking page with the flight details. ');
UNLOCK TABLES;


LOCK TABLES `customer` WRITE;
INSERT INTO `customer` VALUES 
('user1', 'Cust1'), 
('user2', 'Cust2'), 
('user3', 'Cust3');
UNLOCK TABLES;


LOCK TABLES `customerrepresentative` WRITE;
INSERT INTO `customerrepresentative` VALUES 
('rep1', 'Rep1'), 
('rep2', 'Rep2');
UNLOCK TABLES;


LOCK TABLES `siteadmin` WRITE;
INSERT INTO `siteadmin` VALUES 
('admin1', 'Admin1'), 
('admin2', 'Admin2');
UNLOCK TABLES;


LOCK TABLES `ticket` WRITE;
INSERT INTO `ticket` VALUES 
(1, '12A', 300.00, '2023-12-15 10:30:00', 'Alice', 'Johnson', 'Economy'), 
(2, '12B', 500.00, '2023-12-16 11:00:00', 'Bob', 'Smith', 'Business');
UNLOCK TABLES;


LOCK TABLES `ticketadmin` WRITE;
INSERT INTO `ticketadmin` VALUES 
(1, '12A', 300.00, 50.00, '2023-12-15 10:30:00', 'Alice Johnson', 'Alice', 'Johnson', 'Economy', 0, 20.00), 
(2, '12B', 500.00, 75.00, '2023-12-16 11:00:00', 'Bob Smith', 'Bob', 'Smith', 'Business', 0, 25.00);
UNLOCK TABLES;


LOCK TABLES `flightservices` WRITE;
INSERT INTO `flightservices` VALUES ( 'F001', 'A002', 'EWR', 'LAX', 300, 600, 1000, 'AA', 0, 'domestic', '2023-12-07', '12:30:00', '2023-12-07', '18:30:00', '06:00:00', 0 ), ( 'F002', 'A011', 'LAX', 'EWR', 200, 400, 1100, 'AA', 1, 'domestic', '2023-12-09', '08:30:00', '2023-12-09', '18:30:00', '10:00:00', 0 ), ( 'F003', 'A003', 'EWR', 'AMS', 500, 900, 1500, 'BA', 1, 'international', '2023-12-13', '07:30:00', '2023-12-13', '14:30:00', '02:00:00', 1 ), ( 'F011', 'A014', 'EWR', 'LAX', 300, 600, 1000, 'AA', 0, 'domestic', '2023-12-17', '12:30:00', '2023-12-17', '18:30:00', '06:00:00', 0 ), ( 'F013', 'A013', 'EWR', 'AMS', 500, 900, 1500, 'BA', 1, 'international', '2023-12-23', '07:30:00', '2023-12-23', '14:30:00', '02:00:00', 1 ), ( 'F014', 'A014', 'EWR', 'LAX', 250, 500, 800, 'AA', 0, 'domestic', '2023-12-21', '15:30:00', '2023-12-21', '21:30:00', '06:00:00', 0 ), ( 'F015', 'A015', 'LAX', 'EWR', 260, 520, 820, 'DL', 1, 'domestic', '2023-12-22', '16:30:00', '2023-12-22', '22:30:00', '06:00:00', 0 ), ( 'F100', 'A001', 'EWR', 'LAX', 250, 500, 800, 'AA', 0, 'domestic', '2023-12-11', '15:30:00', '2023-12-11', '21:30:00', '06:00:00', 0 ), ( 'F101', 'A002', 'LAX', 'EWR', 260, 520, 820, 'DL', 1, 'domestic', '2023-12-12', '16:30:00', '2023-12-12', '22:30:00', '06:00:00', 0 ), ( 'F102', 'A003', 'EWR', 'AMS', 300, 600, 900, 'BA', 0, 'international', '2023-12-13', '17:30:00', '2023-12-14', '07:30:00', '14:30:00', 0 );
UNLOCK TABLES;


LOCK TABLES `reservations` WRITE;
INSERT INTO `reservations` VALUES (1,'F001','user1','Alice Johnson','2023-12-15','Economy','Confirmed','12A',300.00,'2023-11-01 10:30:00'),(2,'F002','user2','Bob Smith','2023-12-16','Business','Pending','8B',500.00,'2023-11-02 12:45:00'),(3,'F003','user2','Eva Davis','2023-12-17','First Class','Confirmed','1C',800.00,'2023-11-03 15:20:00'),(4,'F003','user2','George White','2023-12-18','Economy','Confirmed','15D',350.00,'2023-11-04 09:15:00');
UNLOCK TABLES;


LOCK TABLES `ticketflightassociatedwith` WRITE;
INSERT INTO `ticketflightassociatedwith` VALUES 
(1, 'F100', 'EWR', 'LAX', '2023-12-15'), 
(2, 'F101', 'LAX', 'EWR', '2023-12-16');
UNLOCK TABLES;


LOCK TABLES `transaction` WRITE;
UNLOCK TABLES;


LOCK TABLES `transactionadmin` WRITE;
INSERT INTO `transactionadmin` VALUES ('user1',1,1),('user2',2,0);
UNLOCK TABLES;


LOCK TABLES `waitinglist` WRITE;
INSERT INTO `waitinglist` VALUES ('user3',1,NULL,NULL);
UNLOCK TABLES;


LOCK TABLES `adminticket` WRITE;
UNLOCK TABLES;


LOCK TABLES `adminticketflightassociatedwith` WRITE;
UNLOCK TABLES;


LOCK TABLES `airlineairportassociatedwith` WRITE;
INSERT INTO `airlineairportassociatedwith` VALUES ('DFW','AA'),('JFK','AA'),('LHR','BA'),('ATL','DL'),('LAX','DL'),('DXB','EK'),('EWR','UA'),('ORD','UA'),('PEK','UA'),('SFO','UA');
UNLOCK TABLES;


LOCK TABLES `admintickets` WRITE;
UNLOCK TABLES;


LOCK TABLES `owns` WRITE;
INSERT INTO `owns` VALUES ('BA', 'A320'), ('SQ', 'A330'), ('QF', 'A340'), ('UA', 'A350'), ('LH', 'A380'), ('AA', 'B737'), ('AF', 'B747'), ('CX', 'B767'), ('DL', 'B777'), ('EK', 'B787');
UNLOCK TABLES;

LOCK TABLES `assists` WRITE;
UNLOCK TABLES;


LOCK TABLES `customersearchesfor` WRITE;
UNLOCK TABLES;


LOCK TABLES `departurearrival` WRITE;
UNLOCK TABLES;


LOCK TABLES `getrevenuesummary` WRITE;
UNLOCK TABLES;


LOCK TABLES `ifnoseat` WRITE;
UNLOCK TABLES;


LOCK TABLES `list` WRITE;
UNLOCK TABLES;


LOCK TABLES `onewayticket` WRITE;
UNLOCK TABLES;


LOCK TABLES `operates` WRITE;
UNLOCK TABLES;


LOCK TABLES `roundtripticket` WRITE;
UNLOCK TABLES;