USE AltitudeAnalysts;

INSERT INTO TravelAgent (Id, FirstName, LastName, Company, Email)
VALUES
(1, 'Alice', 'Johnson', 'Boston Travel Inc.', 'alice.johnson@bostontravel.com'),
(2, 'David', 'Williams', 'Heathrow Travel Co.', 'david.williams@heathrowtravel.com'),
(3, 'Sophia', 'Miller', 'Luton Getaways', 'sophia.miller@lutongetaways.com')
(4, 'Vilma', 'Costall', 'Safari Stars', 'vcostall3@howstuffworks.com'),
(5, 'Emlyn', 'Mickleborough', 'Roaming Rovers', 'emickleborough4@squarespace.com'),
(6, 'Sib', 'Baitman', 'Journey Journeys', 'sbaitman5@naver.com'),
(7, 'Travers', 'Kewish', 'Pathfinder Paradise', 'tkewish6@dmoz.org'),
(8, 'Cher', 'Kunc', 'Voyager Vagabonds', 'ckunc7@360.cn'),
(9, 'Woodie', 'Jacobovitz', 'Odyssey Odyssey', 'wjacobovitz8@nature.com'),
(10, 'Ole', 'Dunnaway', 'Excursion Experts', 'odunnaway9@comsenz.com'),
(11, 'Huberto', 'Cratere', 'Explorer Escapades', 'hcraterea@webs.com'),
(12, 'Agnola', 'Zeal', 'Travel Tribe', 'azealb@webmd.com'),
(13, 'Augustine', 'Meadowcroft', 'Odyssey Oasis', 'ameadowcroftc@mapy.cz'),
(14, 'Urban', 'Janus', 'Journey Junction', 'ujanusd@telegraph.co.uk'),
(15, 'Margarette', 'Bennit', 'Travel Tribe', 'mbennite@ocn.ne.jp'),
(16, 'Malvin', 'Salvador', 'Travel Tribe', 'msalvadorf@mozilla.com'),
(17, 'Cassandra', 'Sainsberry', 'Vagabond Ventures', 'csainsberryg@typepad.com'),
(18, 'Libbi', 'Gooble', 'Adventure Awaits', 'lgoobleh@amazon.com'),
(19, 'Valdemar', 'Jills', 'Adventure Seekers', 'vjillsi@live.com'),
(20, 'Ilise', 'Milland', 'Cruise Captains', 'imillandj@aol.com'),
(21, 'Nickolai', 'Hoyer', 'Journey Junction', 'nhoyerk@nytimes.com'),
(22, 'Noelani', 'Rainon', 'Wanderlust Wonders', 'nrainonl@umich.edu'),
(23, 'Aggie', 'Bosenworth', 'Vagabond Ventures', 'abosenworthm@nsw.gov.au'),
(24, 'Holly', 'Fairpo', 'Pathfinder Paradise', 'hfairpon@nationalgeographic.com'),
(25, 'Cecil', 'Amoore', 'Adventure Awaits', 'camooreo@timesonline.co.uk'),
(26, 'Annice', 'Dimitrescu', 'Pathfinder Adventures', 'adimitrescup@furl.net'),
(27, 'Cass', 'Hagston', 'Voyage Vistas', 'chagstonq@gov.uk'),
(28, 'Herminia', 'Pring', 'Excursion Escapes', 'hpringr@networkadvertising.org'),
(29, 'Hatty', 'Sinderson', 'Pathfinder Paradise', 'hsindersons@simplemachines.org'),
(30, 'Lynea', 'Lyddon', 'Odyssey Oasis', 'llyddont@ftc.gov'),
(31, 'Johnette', 'Stoffer', 'Odyssey Odyssey', 'jstofferu@mozilla.org'),
(32, 'Ardis', 'Whatling', 'Wanderlust Wagon', 'awhatlingv@sogou.com'),
(33, 'Betteanne', 'Buzine', 'Pathfinder Paradise', 'bbuzinew@miibeian.gov.cn'),
(34, 'Kerrin', 'Masser', 'Nomad Navigators', 'kmasserx@cnbc.com'),
(35, 'Milena', 'Nipper', 'Wanderlust Wonders', 'mnippery@jalbum.net'),
(36, 'Keane', 'Corey', 'Wanderlust Warriors', 'kcoreyz@bbb.org'),
(37, 'Gretchen', 'Fitzsymonds', 'Explorer Expeditions', 'gfitzsymonds10@people.com.cn'),
(38, 'Vincent', 'Aymerich', 'Voyage Vistas', 'vaymerich11@stanford.edu'),
(39, 'Ethan', 'Draude', 'Voyager Vagabonds', 'edraude12@1und1.de'),
(40, 'Benedicto', 'Letts', 'Journey Journeys', 'bletts13@symantec.com');


INSERT INTO Airline (Name, Id)
VALUES
('Qatar Airways', 1),
('Aeromexico', 2),
('Swiss International Air Lines', 3),
('Qatar Airways', 4),
('Interjet', 5),
('Aer Lingus', 6),
('Qatar Airways', 7),
('JetBlue', 8),
('Azul Brazilian Airlines', 9),
('Volaris', 10),
('Southwest Airlines', 11),
('Iberia', 12),
('Allegiant Air', 13),
('American Airlines', 14),
('Qatar Airways', 15),
('Interjet', 16),
('EasyJet', 17),
('KLM', 18),
('KLM', 19),
('Volaris', 20),
('Aer Lingus', 21),
('Azul Brazilian Airlines', 22),
('British Airways', 23),
('LATAM Airlines', 24),
('United Airlines', 25),
('Volaris', 26),
('WestJet', 27),
('WestJet', 28),
('Aerolineas Argentinas', 29),
('JetBlue', 30),
('Volaris', 31),
('Frontier Airlines', 32),
('Qantas', 33),
('Air Canada', 34),
('KLM', 35),
('Qatar Airways', 36),
('Spirit Airlines', 37),
('Air New Zealand', 38),
('Qatar Airways', 39),
('Allegiant Air', 40);

INSERT INTO AirlineManager (Id, FirstName, LastName, Email, AirlineId)
VALUES
(1, 'Linell', 'Leyborne', 'lleyborne0@furl.net', 1),
(2, 'Orlan', 'Lyall', 'olyall1@amazon.co.uk', 2),
(3, 'Enos', 'Summerhayes', 'esummerhayes2@gizmodo.com', 3),
(4, 'Yorker', 'Comport', 'ycomport3@hexun.com', 4),
(5, 'Ronalda', 'Haddow', 'rhaddow4@linkedin.com', 5),
(6, 'Donnie', 'Cansdell', 'dcansdell5@hhs.gov', 6),
(7, 'Chrissie', 'Zamorano', 'czamorano6@wufoo.com', 7),
(8, 'Derward', 'Baguley', 'dbaguley7@mozilla.com', 8),
(9, 'Gloriane', 'Basindale', 'gbasindale8@miitbeian.gov.cn', 9),
(10, 'Roy', 'Davio', 'rdavio9@prnewswire.com', 10),
(11, 'Geraldine', 'Checo', 'gchecoa@woothemes.com', 11),
(12, 'Zolly', 'Guard', 'zguardb@mediafire.com', 12),
(13, 'Evelyn', 'Drabble', 'edrabblec@washington.edu', 13),
(14, 'Rora', 'Munro', 'rmunrod@yellowbook.com', 14),
(15, 'Mallory', 'Jaycock', 'mjaycocke@seesaa.net', 15),
(16, 'Oran', 'Savage', 'osavagef@aboutads.info', 16),
(17, 'Verena', 'Bellon', 'vbellong@naver.com', 17),
(18, 'Weylin', 'Lamcken', 'wlamckenh@nih.gov', 18),
(19, 'Helge', 'Odger', 'hodgeri@dailymail.co.uk', 19),
(20, 'Aloin', 'Segoe', 'asegoej@ycombinator.com', 20),
(21, 'Jules', 'Wolverson', 'jwolversonk@arizona.edu', 21),
(22, 'Lavena', 'Garms', 'lgarmsl@digg.com', 22),
(23, 'Caresse', 'Tidcombe', 'ctidcombem@epa.gov', 23),
(24, 'Nicolas', 'Edmondson', 'nedmondsonn@aboutads.info', 24),
(25, 'Nanny', 'Mc Meekin', 'nmcmeekino@wikipedia.org', 25),
(26, 'Andriana', 'Sylett', 'asylettp@edublogs.org', 26),
(27, 'Arvy', 'Jacobi', 'ajacobiq@google.co.uk', 27),
(28, 'Betti', 'Saing', 'bsaingr@apache.org', 28),
(29, 'Dionis', 'Gillio', 'dgillios@arizona.edu', 29),
(30, 'Onfre', 'Larkby', 'olarkbyt@myspace.com', 30),
(31, 'Marja', 'Georgeon', 'mgeorgeonu@bbc.co.uk', 31),
(32, 'Abigale', 'Callicott', 'acallicottv@drupal.org', 32),
(33, 'Carlina', 'Witcombe', 'cwitcombew@dailymail.co.uk', 33),
(34, 'Ferrel', 'Nafziger', 'fnafzigerx@accuweather.com', 34),
(35, 'Seana', 'Oades', 'soadesy@cbslocal.com', 35),
(36, 'Brennen', 'Merton', 'bmertonz@scientificamerican.com', 36),
(37, 'Phyllida', 'Balfour', 'pbalfour10@sourceforge.net', 37),
(38, 'Sean', 'Forsbey', 'sforsbey11@blogtalkradio.com', 38),
(39, 'Karena', 'Edghinn', 'kedghinn12@constantcontact.com', 39),
(40, 'Micky', 'Henrion', 'mhenrion13@ox.ac.uk', 40);



INSERT INTO Airport (Code, Disrupted, SecurityWaitTime)
VALUES
('SKV', 1, 50),
('GDJ', 1, 21),
('KAA', 1, 36),
('MUC', 1, 76),
('QCU', 0, 69),
('QFI', 0, 19),
('AWR', 1, 65),
('DBN', 1, 32),
('SBF', 0, 23),
('OAX', 1, 2),
('KNE', 0, 47),
('SXO', 1, 4),
('BRN', 1, 40),
('YNH', 1, 100),
('OSU', 0, 59),
('KPL', 1, 28),
('NIS', 0, 91),
('YMK', 1, 82),
('CKN', 0, 57),
('GNY', 0, 43),
('DED', 0, 67),
('TBP', 1, 52),
('TUN', 1, 36),
('KCA', 1, 55),
('PFO', 1, 28),
('NBB', 1, 29),
('GOE', 0, 57),
('SHR', 1, 73),
('SNQ', 0, 10),
('KBS', 0, 22),
('ZBM', 1, 77),
('AKG', 1, 30),
('TBT', 1, 93),
('FGU', 0, 44),
('TMD', 1, 65),
('MYI', 0, 15),
('EYR', 1, 16),
('ATX', 1, 95),
('MDC', 1, 92),
('AZI', 1, 8);



INSERT INTO Status (Id, Cancelled, OnTime, DelayedCascading, DelayedTechnicalIssues, DelayedAdminIssues, DelayedOther, DelayedWeather, DelayedOperational)
VALUES
(1, 0, 1, 1, 0, 0, 0, 0, 1),
(2, 0, 0, 1, 1, 1, 1, 1, 1),
(3, 1, 0, 0, 0, 1, 0, 0, 0),
(4, 0, 1, 1, 1, 1, 0, 0, 1),
(5, 0, 0, 1, 1, 0, 0, 1, 1),
(6, 1, 0, 1, 0, 1, 1, 1, 1),
(7, 1, 0, 1, 1, 0, 0, 0, 0),
(8, 0, 1, 1, 1, 1, 1, 0, 1),
(9, 1, 1, 1, 1, 1, 0, 0, 0),
(10, 0, 0, 1, 1, 1, 0, 0, 1),
(11, 1, 0, 1, 0, 0, 0, 1, 1),
(12, 1, 0, 1, 1, 0, 0, 0, 0),
(13, 0, 0, 1, 1, 0, 1, 0, 0),
(14, 0, 1, 1, 0, 0, 1, 0, 1),
(15, 0, 0, 0, 0, 1, 0, 1, 0),
(16, 0, 0, 1, 0, 1, 0, 0, 1),
(17, 1, 1, 0, 0, 1, 1, 1, 0),
(18, 0, 1, 0, 1, 1, 0, 1, 0),
(19, 0, 0, 1, 1, 0, 1, 1, 0),
(20, 1, 1, 1, 1, 0, 0, 0, 0),
(21, 1, 0, 0, 0, 1, 1, 1, 1),
(22, 0, 0, 0, 0, 0, 1, 0, 1),
(23, 1, 0, 0, 0, 1, 1, 1, 1),
(24, 0, 0, 0, 1, 1, 1, 1, 1),
(25, 0, 1, 1, 1, 1, 0, 0, 1),
(26, 1, 1, 0, 0, 1, 1, 1, 0),
(27, 1, 1, 1, 1, 0, 0, 0, 0),
(28, 1, 0, 0, 0, 1, 0, 0, 1),
(29, 0, 0, 0, 0, 0, 0, 0, 0),
(30, 1, 1, 1, 0, 0, 0, 1, 0),
(31, 1, 1, 0, 0, 1, 0, 1, 0),
(32, 0, 1, 0, 0, 0, 0, 1, 0),
(33, 1, 0, 0, 0, 0, 0, 0, 0),
(34, 1, 1, 1, 1, 0, 1, 0, 0),
(35, 0, 0, 0, 1, 1, 1, 1, 1),
(36, 0, 1, 1, 0, 0, 0, 0, 0),
(37, 1, 0, 0, 0, 1, 1, 0, 1),
(38, 1, 1, 0, 0, 1, 1, 0, 1),
(39, 0, 1, 0, 1, 1, 0, 1, 1),
(40, 0, 0, 0, 1, 1, 1, 0, 1);

INSERT INTO Flight (FlightNumber, ArrivalTime, DepartureTime, DepartureDate, Terminal, Gate, Occupancy, Price, FlightTime, AirlineManagerId, ArrivalAirportCode, DepartureAirportCode, Status, AirlineId)
VALUES
(1, '23:59:59', '12:10:15', '3652-01-24', 'T', 'T53', 326, 3299, 224, 12, 'KNE', 'KAA', 1, 10),
(2, '00:00:00', '09:10:30', '9519-95-65', 'Z', 'Z9', 135, 3448, 234, 31, 'MYI', 'AWR', 1, 11),
(3, '23:59:59', '18:40:50', '1751-27-98', 'Q', 'Q2', 305, 191, 1000, 28, 'SHR', 'KNE', 1, 20),
(4, '23:59:59', '02:05:05', '1772-85-09', 'X', 'X1', 802, 4394, 139, 33, 'DBN', 'MDC', 1, 25),
(5, '09:35:50', '20:35:35', '9053-97-42', 'A', 'A8', 517, 1013, 951, 5, 'MDC', 'SXO', 1, 27),
(6, '23:59:59', '09:25:35', '6756-91-84', 'G', 'G8', 351, 3588, 639, 27, 'DED', 'QCU', 1, 23),
(7, '11:25:45', '18:40:50', '8042-30-26', 'C', 'C3', 656, 3890, 719, 13, 'KNE', 'QFI', 1, 19),
(8, '04:25:10', '08:45:20', '0019-95-54', 'D', 'D7', 173, 4112, 280, 29, 'SBF', 'SHR', 2, 10),
(9, '05:10:35', '18:40:15', '5978-26-19', 'G', 'G19', 93, 901, 739, 18, 'SXO', 'GNY', 1, 30),
(10, '11:15:45', '08:15:00', '6977-72-31', 'X', 'X33', 480, 2381, 271, 10, 'KNE', 'EYR', 1, 24),
(11, '16:35:10', '15:30:50', '0441-39-20', 'E', 'E5', 131, 2583, 356, 15, 'SBF', 'SNQ', 1, 39),
(12, '18:20:05', '20:40:10', '8792-27-41', 'F', 'F60', 414, 315, 510, 3, 'DED', 'AKG', 2, 26),
(13, '21:55:15', '16:30:35', '5269-59-31', 'L', 'L30', 262, 3414, 108, 10, 'SHR', 'ZBM', 2, 20),
(14, '09:35:50', '22:55:30', '3471-35-10', 'P', 'P6', 236, 3513, 916, 6, 'AKG', 'SNQ', 1, 8),
(15, '15:30:45', '11:55:40', '1358-45-91', 'M', 'M24', 568, 1533, 702, 20, 'KNE', 'OSU', 2, 29),
(16, '00:00:00', '09:25:35', '4244-70-87', 'E', 'E58', 232, 2208, 168, 3, 'PFO', 'KBS', 1, 20),
(17, '10:45:20', '05:30:10', '6060-18-39', 'Q', 'Q96', 618, 591, 458, 15, 'TBT', 'TBT', 1, 8),
(18, '06:55:30', '19:20:15', '0453-06-10', 'S', 'S47', 778, 2006, 91, 34, 'ZBM', 'GNY', 2, 9),
(19, '05:10:35', '13:15:40', '4045-45-27', 'F', 'F22', 303, 3842, 125, 6, 'DED', 'KPL', 1, 4),
(20, '06:55:30', '06:15:40', '4779-04-07', 'O', 'O8', 260, 2952, 454, 6, 'QCU', 'GOE', 1, 13),
(21, '03:55:30', '19:10:10', '7645-48-12', 'I', 'I4', 176, 2432, 785, 20, 'TUN', 'SBF', 1, 25),
(22, '03:10:30', '06:15:25', '3119-02-63', 'U', 'U7', 706, 4998, 511, 9, 'TBP', 'NBB', 1, 35),
(23, '04:25:10', '08:30:00', '5467-93-39', 'F', 'F58', 738, 4997, 210, 27, 'OAX', 'DBN', 2, 17),
(24, '14:40:20', '19:00:45', '8963-92-32', 'R', 'R2', 213, 300, 92, 25, 'KCA', 'SBF', 2, 7),
(25, '17:20:00', '05:40:55', '7490-46-65', 'Z', 'Z6', 170, 2208, 537, 4, 'GNY', 'KCA', 2, 29),
(26, '10:45:20', '12:05:00', '3076-27-40', 'Q', 'Q24', 153, 2425, 374, 30, 'GNY', 'YNH', 1, 9),
(27, '21:55:15', '15:30:50', '0187-90-53', 'D', 'D22', 510, 323, 357, 12, 'KPL', 'EYR', 1, 1),
(28, '08:30:45', '16:45:55', '2915-23-98', 'E', 'E7', 120, 2018, 256, 40, 'GOE', 'ZBM', 1, 39),
(29, '22:48:15', '20:30:15', '0902-08-89', 'J', 'J1', 587, 4742, 244, 33, 'MUC', 'BRN', 1, 8),
(30, '23:59:59', '11:50:35', '0579-54-86', 'T', 'T5', 448, 2874, 51, 15, 'SNQ', 'SHR', 2, 8),
(31, '15:30:45', '22:10:45', '7122-82-51', 'G', 'G8', 321, 1866, 743, 25, 'TUN', 'NBB', 2, 18),
(32, '07:40:20', '06:10:50', '9733-88-11', 'A', 'A9', 507, 4075, 499, 32, 'ATX', 'KPL', 1, 5),
(33, '07:50:20', '04:25:35', '6902-32-76', 'C', 'C3', 660, 3935, 577, 1, 'ATX', 'OAX', 1, 22),
(34, '23:59:59', '19:00:45', '6405-92-21', 'V', 'V57', 533, 1798, 307, 5, 'FGU', 'MUC', 1, 34),
(35, '23:59:59', '08:15:00', '8264-21-60', 'H', 'H4', 612, 4755, 671, 27, 'MYI', 'ATX', 2, 12),
(36, '09:45:50', '04:15:55', '7869-55-59', 'X', 'X81', 279, 4318, 971, 17, 'NBB', 'KPL', 1, 23),
(37, '12:05:55', '18:05:00', '0774-34-97', 'E', 'E5', 716, 986, 304, 11, 'GOE', 'DED', 2, 11),
(38, '20:40:25', '11:50:35', '8282-95-89', 'H', 'H15', 329, 3589, 1057, 36, 'TBT', 'YNH', 1, 38),
(39, '14:20:40', '16:45:55', '9310-44-16', 'J', 'J3', 351, 4118, 742, 33, 'AKG', 'AZI', 1, 37),
(40, '08:20:10', '14:05:25', '3122-76-64', 'J', 'J4', 758, 2960, 1047, 32, 'TBT', 'KPL', 1, 5);

INSERT INTO AirportManager (Id, FirstName, LastName, AirportCode)
VALUES
(1, 'Raeann', 'Lafontaine', 'SKV'),
(2, 'Hillel', 'Weatherill', 'GDJ'),
(3, 'Corilla', 'Comizzoli', 'KAA'),
(4, 'Farr', 'Ebourne', 'MUC'),
(5, 'Brandie', 'Shivlin', 'QCU'),
(6, 'Hildagarde', 'Yellop', 'QFI'),
(7, 'Olly', 'Iredell', 'AWR'),
(8, 'Davidson', 'Drinnan', 'DBN'),
(9, 'Deedee', 'Yablsley', 'SBF'),
(10, 'Karine', 'Ohanessian', 'OAX'),
(11, 'Kanya', 'Sahlstrom', 'KNE'),
(12, 'Audrye', 'Keher', 'SXO'),
(13, 'Rhys', 'Drissell', 'BRN'),
(14, 'Bibi', 'Berni', 'YNH'),
(15, 'Debbi', 'Rembrant', 'OSU'),
(16, 'Arleta', 'Templar', 'KPL'),
(17, 'Port', 'Allanby', 'NIS'),
(18, 'Pennie', 'Burrage', 'YMK'),
(19, 'George', 'Frunks', 'CKN'),
(20, 'Karel', 'Fillgate', 'GNY'),
(21, 'Monica', 'Pestridge', 'DED'),
(22, 'Cassie', 'Pittson', 'TBP'),
(23, 'Beau', 'Wigelsworth', 'TUN'),
(24, 'Garwood', 'Purver', 'KCA'),
(25, 'Kellsie', 'McGrann', 'PFO'),
(26, 'Melodie', 'Humber', 'NBB'),
(27, 'Beth', 'Kleinmintz', 'GOE'),
(28, 'Neal', 'Pates', 'SHR'),
(29, 'Eugen', 'Syer', 'SNQ'),
(30, 'Karita', 'Tunno', 'KBS'),
(31, 'Allis', 'Gotmann', 'ZBM'),
(32, 'Isidor', 'Dumbreck', 'AKG'),
(33, 'Fredericka', 'McMenamin', 'TBT'),
(34, 'Robbert', 'Merriman', 'FGU'),
(35, 'Dolly', 'Clawson', 'TMD'),
(36, 'Tamara', 'Ramsier', 'MYI'),
(37, 'Micky', 'Abbs', 'EYR'),
(38, 'Barrie', 'Sammut', 'ATX'),
(39, 'Witty', 'Dunster', 'MDC'),
(40, 'Lars', 'Clethro', 'AZI');

INSERT INTO Tracks (FlightNumber, AirportManagerID)
VALUES
(1, 21),
(2, 1),
(3, 6),
(4, 18),
(5, 39),
(6, 2),
(7, 15),
(8, 29),
(9, 14),
(10, 5),
(11, 1),
(12, 3),
(13, 3),
(14, 40),
(15, 32),
(16, 13),
(17, 35),
(18, 33),
(19, 33),
(20, 3),
(21, 40),
(22, 21),
(23, 6),
(24, 11),
(25, 38),
(26, 2),
(27, 5),
(28, 30),
(29, 9),
(30, 15),
(31, 14),
(32, 37),
(33, 24),
(34, 32),
(35, 33),
(36, 26),
(37, 21),
(38, 23),
(39, 33),
(40, 17),
(41, 38),
(42, 23),
(43, 26),
(44, 16),
(45, 26),
(46, 13),
(47, 7),
(48, 4),
(49, 3),
(50, 31),
(51, 34),
(52, 3),
(53, 35),
(54, 37),
(55, 40),
(56, 24),
(57, 13),
(58, 11),
(59, 24),
(60, 24),
(61, 13),
(62, 18),
(63, 18),
(64, 13),
(65, 7),
(66, 27),
(67, 35),
(68, 25),
(69, 28),
(70, 24),
(71, 27),
(72, 7),
(73, 22),
(74, 38),
(75, 4),
(76, 24),
(77, 19),
(78, 27),
(79, 5),
(80, 32),
(81, 39),
(82, 24),
(83, 8),
(84, 23),
(85, 38),
(86, 4),
(87, 1),
(88, 32),
(89, 7),
(90, 18),
(91, 16),
(92, 10),
(93, 30),
(94, 13),
(95, 31),
(96, 28),
(97, 9),
(98, 5),
(99, 36),
(100, 36),
(101, 40),
(102, 6),
(103, 21),
(104, 11),
(105, 25),
(106, 21),
(107, 5),
(108, 35),
(109, 24),
(110, 38),
(111, 28),
(112, 18),
(113, 32),
(114, 35),
(115, 2),
(116, 33),
(117, 5),
(118, 16),
(119, 15),
(120, 17),
(121, 23),
(122, 25),
(123, 27),
(124, 31),
(125, 3);

INSERT INTO Seat (Available, Class, FlightNumber, SeatNumber)
VALUES
(0, 'First', 20, 234),
(0, 'Premium Economy', 19, 145),
(1, 'First', 30, 242),
(1, 'First', 36, 28),
(1, 'Economy', 22, 155),
(0, 'Economy', 24, 244),
(0, 'First', 38, 259),
(1, 'Business', 15, 513),
(0, 'Economy', 5, 140),
(0, 'Business', 28, 384),
(1, 'First', 23, 14),
(0, 'Premium Economy', 40, 487),
(0, 'Business', 9, 536),
(0, 'Business', 4, 134),
(1, 'First', 21, 100),
(0, 'Economy', 8, 209),
(1, 'First', 13, 347),
(1, 'Premium Economy', 18, 508),
(0, 'First', 9, 235),
(0, 'First', 17, 197),
(1, 'Premium Economy', 17, 233),
(0, 'Business', 29, 139),
(0, 'Economy', 24, 38),
(0, 'Premium Economy', 2, 144),
(1, 'Premium Economy', 6, 76),
(0, 'Economy', 26, 584),
(0, 'First', 32, 267),
(0, 'Business', 34, 45),
(1, 'Business', 31, 409),
(1, 'Premium Economy', 5, 342),
(0, 'Premium Economy', 12, 528),
(1, 'Economy', 28, 164),
(0, 'Economy', 10, 142),
(0, 'Premium Economy', 17, 112),
(1, 'Economy', 35, 153),
(1, 'Business', 25, 288),
(0, 'Economy', 27, 97),
(0, 'Premium Economy', 32, 214),
(1, 'Premium Economy', 10, 229),
(0, 'Economy', 38, 306),
(1, 'Premium Economy', 11, 514),
(1, 'Economy', 6, 203),
(1, 'Economy', 21, 590),
(1, 'Premium Economy', 31, 364),
(1, 'First', 39, 81),
(0, 'First', 35, 485),
(0, 'First', 10, 31),
(1, 'Premium Economy', 7, 452),
(1, 'Economy', 16, 446),
(1, 'Economy', 14, 412),
(0, 'Premium Economy', 28, 510),
(0, 'Business', 23, 263),
(1, 'First', 35, 567),
(1, 'Premium Economy', 25, 475),
(0, 'Economy', 37, 221),
(1, 'Business', 33, 72),
(0, 'Economy', 32, 473),
(1, 'Premium Economy', 36, 524),
(0, 'Business', 32, 325),
(1, 'Economy', 21, 381),
(1, 'Premium Economy', 5, 431),
(0, 'Business', 35, 252),
(0, 'Economy', 37, 401),
(0, 'Premium Economy', 40, 285),
(0, 'First', 40, 325),
(0, 'Business', 23, 216),
(1, 'Business', 18, 605),
(1, 'Business', 15, 430),
(1, 'First', 37, 207),
(0, 'First', 39, 72),
(0, 'Business', 38, 403),
(1, 'Economy', 22, 265),
(1, 'First', 12, 558),
(0, 'Business', 14, 504),
(0, 'First', 15, 41);

INSERT INTO Passenger (FirstName, LastName, DOB, Email, Id)
VALUES
('Tallia', 'Featley', '1937-12-31', 'tfeatley0@mapy.cz', 1),
('Sallee', 'Sidden', '2003-09-04', 'ssidden1@blogger.com', 2),
('Linnie', 'Marczyk', '2001-12-30', 'lmarczyk2@google.ca', 3),
('Jena', 'Donalson', '2022-12-13', 'jdonalson3@opera.com', 4),
('Melody', 'Passfield', '1952-01-28', 'mpassfield4@ovh.net', 5),
('Turner', 'Hymans', '2023-10-31', 'thymans5@icio.us', 6),
('Karon', 'Goldspink', '2011-06-18', 'kgoldspink6@youtube.com', 7),
('Carlie', 'Franses', '1955-03-09', 'cfranses7@hostgator.com', 8),
('Cherye', 'Spridgeon', '2020-03-30', 'cspridgeon8@stanford.edu', 9),
('Nara', 'Hampstead', '2022-11-08', 'nhampstead9@xing.com', 10),
('Davidson', 'Dysert', '2023-02-31', 'ddyserta@microsoft.com', 11),
('Mark', 'Setterthwait', '2024-03-13', 'msetterthwaitb@sitemeter.com', 12),
('Charo', 'Eleshenar', '1990-11-03', 'celeshenarc@amazon.co.jp', 13),
('Kelsi', 'Boissier', '1999-11-30', 'kboissierd@fastcompany.com', 14),
('Aridatha', 'Duberry', '1966-07-30', 'aduberrye@utexas.edu', 15),
('Solomon', 'Mendel', '2001-12-31', 'smendelf@networksolutions.com', 16),
('Tallie', 'Ramsey', '2025-12-29', 'tramseyg@skyrock.com', 17),
('Kass', 'Bertie', '2011-10-06', 'kbertieh@howstuffworks.com', 18),
('Ilyssa', 'Questier', '2024-11-30', 'iquestieri@mail.ru', 19),
('Sullivan', 'Dummigan', '1976-05-02', 'sdummiganj@vkontakte.ru', 20),
('Isador', 'Sennett', '1953-12-09', 'isennettk@cnbc.com', 21),
('Quinton', 'Buessen', '1967-11-24', 'qbuessenl@goodreads.com', 22),
('Jessalin', 'Sugarman', '2001-12-03', 'jsugarmanm@1688.com', 23),
('Chris', 'Billes', '1932-03-31', 'cbillesn@hugedomains.com', 24),
('Justine', 'Cutbirth', '2014-12-29', 'jcutbirtho@washingtonpost.com', 25),
('Joannes', 'Regis', '1947-07-03', 'jregisp@liveinternet.ru', 26),
('Alie', 'Daldry', '2020-07-01', 'adaldryq@angelfire.com', 27),
('Georas', 'Lambal', '2022-11-08', 'glambalr@plala.or.jp', 28),
('Ber', 'Sainsbury-Brown', '2021-12-04', 'bsainsburybrowns@bbc.co.uk', 29),
('Winna', 'Swaine', '2022-07-31', 'wswainet@whitehouse.gov', 30),
('Shirline', 'Tydd', '2022-10-11', 'styddu@fema.gov', 31),
('Celestina', 'Manzell', '2007-04-30', 'cmanzellv@163.com', 32),
('Murray', 'Kave', '1993-01-31', 'mkavew@com.com', 33),
('Willi', 'Culross', '2023-10-30', 'wculrossx@example.com', 34),
('Johnnie', 'Skidmore', '2008-04-18', 'jskidmorey@thetimes.co.uk', 35),
('Lorilee', 'Dowsett', '2022-10-30', 'ldowsettz@cpanel.net', 36),
('Harris', 'Grube', '2020-01-07', 'hgrube10@admin.ch', 37),
('Orly', 'Minshall', '2001-02-30', 'ominshall11@so-net.ne.jp', 38),
('Omero', 'Budibent', '1954-07-15', 'obudibent12@myspace.com', 39),
('Roosevelt', 'Pindar', '2000-12-30', 'rpindar13@cnet.com', 40);

INSERT INTO Booked (BoardingPass, Amenities, Luggage, FlightNumber, PassengerId)
VALUES
('https://skyboundsolutions.com/boarding-pass/860Yi', 1, 1, 11, 31),
('https://skyboundsolutions.com/boarding-pass/219yl', 1, 1, 15, 38),
('https://skyboundsolutions.com/boarding-pass/476Fy', 0, 5, 1, 1),
('https://skyboundsolutions.com/boarding-pass/024eS', 1, 1, 17, 37),
('https://skyboundsolutions.com/boarding-pass/747YJ', 0, 5, 28, 36),
('https://skyboundsolutions.com/boarding-pass/872Cr', 0, 5, 11, 19),
('https://skyboundsolutions.com/boarding-pass/398Yx', 1, 0, 15, 36),
('https://skyboundsolutions.com/boarding-pass/877lP', 0, 5, 35, 23),
('https://skyboundsolutions.com/boarding-pass/641UD', 1, 5, 24, 15),
('https://skyboundsolutions.com/boarding-pass/892xj', 0, 5, 31, 11),
('https://skyboundsolutions.com/boarding-pass/173jS', 1, 5, 36, 31),
('https://skyboundsolutions.com/boarding-pass/994sB', 0, 3, 34, 1),
('https://skyboundsolutions.com/boarding-pass/009xd', 1, 4, 32, 20),
('https://skyboundsolutions.com/boarding-pass/652Wp', 0, 3, 17, 19),
('https://skyboundsolutions.com/boarding-pass/656MR', 1, 4, 17, 12),
('https://skyboundsolutions.com/boarding-pass/339ds', 0, 1, 28, 21),
('https://skyboundsolutions.com/boarding-pass/033uS', 0, 4, 28, 1),
('https://skyboundsolutions.com/boarding-pass/781fJ', 1, 3, 4, 1),
('https://skyboundsolutions.com/boarding-pass/713VZ', 1, 2, 22, 40),
('https://skyboundsolutions.com/boarding-pass/347Fk', 0, 3, 1, 7),
('https://skyboundsolutions.com/boarding-pass/024cU', 0, 1, 38, 22),
('https://skyboundsolutions.com/boarding-pass/225di', 1, 1, 7, 16),
('https://skyboundsolutions.com/boarding-pass/434wc', 0, 1, 11, 22),
('https://skyboundsolutions.com/boarding-pass/040be', 0, 1, 18, 33),
('https://skyboundsolutions.com/boarding-pass/460fF', 0, 2, 26, 11),
('https://skyboundsolutions.com/boarding-pass/923QO', 1, 5, 6, 3),
('https://skyboundsolutions.com/boarding-pass/476Xn', 0, 4, 37, 11),
('https://skyboundsolutions.com/boarding-pass/691Gu', 0, 2, 40, 27),
('https://skyboundsolutions.com/boarding-pass/505Ac', 0, 0, 11, 23),
('https://skyboundsolutions.com/boarding-pass/632oM', 0, 1, 29, 24),
('https://skyboundsolutions.com/boarding-pass/888kp', 0, 4, 16, 19),
('https://skyboundsolutions.com/boarding-pass/514IK', 1, 5, 26, 31),
('https://skyboundsolutions.com/boarding-pass/546Bh', 1, 4, 20, 22),
('https://skyboundsolutions.com/boarding-pass/317BN', 0, 5, 24, 4),
('https://skyboundsolutions.com/boarding-pass/436Wx', 1, 2, 4, 11),
('https://skyboundsolutions.com/boarding-pass/916aT', 1, 2, 24, 9),
('https://skyboundsolutions.com/boarding-pass/765OR', 1, 5, 23, 22),
('https://skyboundsolutions.com/boarding-pass/857yB', 0, 4, 40, 39),
('https://skyboundsolutions.com/boarding-pass/899qn', 0, 5, 3, 16),
('https://skyboundsolutions.com/boarding-pass/378Xa', 1, 4, 18, 6),
('https://skyboundsolutions.com/boarding-pass/506Da', 1, 1, 2, 23),
('https://skyboundsolutions.com/boarding-pass/382uW', 0, 1, 25, 26),
('https://skyboundsolutions.com/boarding-pass/521zc', 1, 5, 31, 2),
('https://skyboundsolutions.com/boarding-pass/154py', 0, 3, 30, 22),
('https://skyboundsolutions.com/boarding-pass/492xe', 1, 4, 29, 11),
('https://skyboundsolutions.com/boarding-pass/871MT', 1, 2, 6, 25),
('https://skyboundsolutions.com/boarding-pass/579Qz', 0, 3, 9, 12),
('https://skyboundsolutions.com/boarding-pass/293Df', 1, 3, 37, 25),
('https://skyboundsolutions.com/boarding-pass/165DC', 0, 2, 8, 29),
('https://skyboundsolutions.com/boarding-pass/395Ws', 0, 4, 6, 5),
('https://skyboundsolutions.com/boarding-pass/063va', 1, 1, 5, 34),
('https://skyboundsolutions.com/boarding-pass/449JL', 1, 0, 27, 17),
('https://skyboundsolutions.com/boarding-pass/352Ls', 0, 0, 4, 31),
('https://skyboundsolutions.com/boarding-pass/034Zo', 1, 3, 25, 29),
('https://skyboundsolutions.com/boarding-pass/168iz', 1, 3, 22, 3),
('https://skyboundsolutions.com/boarding-pass/404iu', 1, 4, 34, 27),
('https://skyboundsolutions.com/boarding-pass/101ag', 1, 4, 33, 24),
('https://skyboundsolutions.com/boarding-pass/486tL', 0, 4, 12, 15),
('https://skyboundsolutions.com/boarding-pass/779Px', 0, 5, 34, 33),
('https://skyboundsolutions.com/boarding-pass/179Xs', 1, 5, 19, 6),
('https://skyboundsolutions.com/boarding-pass/035nw', 0, 2, 27, 19),
('https://skyboundsolutions.com/boarding-pass/581We', 1, 4, 22, 28),
('https://skyboundsolutions.com/boarding-pass/011fQ', 0, 1, 38, 17),
('https://skyboundsolutions.com/boarding-pass/801Lw', 0, 0, 8, 40),
('https://skyboundsolutions.com/boarding-pass/235gZ', 0, 2, 19, 26),
('https://skyboundsolutions.com/boarding-pass/877mO', 1, 2, 32, 37),
('https://skyboundsolutions.com/boarding-pass/618HS', 1, 2, 22, 6),
('https://skyboundsolutions.com/boarding-pass/612tG', 1, 3, 12, 27),
('https://skyboundsolutions.com/boarding-pass/706vX', 1, 5, 1, 24),
('https://skyboundsolutions.com/boarding-pass/294uI', 1, 5, 27, 24),
('https://skyboundsolutions.com/boarding-pass/349IG', 1, 3, 21, 30),
('https://skyboundsolutions.com/boarding-pass/578qw', 1, 4, 20, 21),
('https://skyboundsolutions.com/boarding-pass/871TT', 1, 0, 14, 12),
('https://skyboundsolutions.com/boarding-pass/860Zj', 0, 2, 14, 7),
('https://skyboundsolutions.com/boarding-pass/730if', 1, 1, 23, 35),
('https://skyboundsolutions.com/boarding-pass/748QQ', 0, 1, 14, 24),
('https://skyboundsolutions.com/boarding-pass/938iX', 0, 0, 31, 26),
('https://skyboundsolutions.com/boarding-pass/143YB', 0, 5, 4, 31),
('https://skyboundsolutions.com/boarding-pass/914uj', 0, 0, 19, 1),
('https://skyboundsolutions.com/boarding-pass/643Xy', 1, 1, 19, 2),
('https://skyboundsolutions.com/boarding-pass/800XD', 0, 4, 31, 5),
('https://skyboundsolutions.com/boarding-pass/055df', 1, 2, 11, 32),
('https://skyboundsolutions.com/boarding-pass/688KS', 0, 5, 24, 22),
('https://skyboundsolutions.com/boarding-pass/909LE', 1, 1, 33, 1),
('https://skyboundsolutions.com/boarding-pass/298iv', 0, 5, 40, 29),
('https://skyboundsolutions.com/boarding-pass/670KQ', 0, 4, 31, 28),
('https://skyboundsolutions.com/boarding-pass/379jd', 1, 5, 18, 27),
('https://skyboundsolutions.com/boarding-pass/263Yz', 0, 0, 17, 4),
('https://skyboundsolutions.com/boarding-pass/771xV', 0, 0, 23, 37),
('https://skyboundsolutions.com/boarding-pass/512Mo', 1, 4, 21, 26),
('https://skyboundsolutions.com/boarding-pass/856Cb', 0, 3, 27, 3),
('https://skyboundsolutions.com/boarding-pass/222YP', 0, 5, 11, 40),
('https://skyboundsolutions.com/boarding-pass/081ZU', 0, 3, 17, 36),
('https://skyboundsolutions.com/boarding-pass/286oJ', 1, 5, 25, 35),
('https://skyboundsolutions.com/boarding-pass/025Dr', 1, 5, 33, 33),
('https://skyboundsolutions.com/boarding-pass/001WY', 1, 1, 35, 40),
('https://skyboundsolutions.com/boarding-pass/204TS', 1, 4, 32, 8),
('https://skyboundsolutions.com/boarding-pass/843Oj', 0, 4, 11, 26),
('https://skyboundsolutions.com/boarding-pass/118yP', 0, 3, 28, 21),
('https://skyboundsolutions.com/boarding-pass/654Gt', 0, 1, 37, 5),
('https://skyboundsolutions.com/boarding-pass/700gL', 0, 3, 12, 4),
('https://skyboundsolutions.com/boarding-pass/857YN', 0, 3, 19, 33),
('https://skyboundsolutions.com/boarding-pass/321vD', 0, 3, 14, 29),
('https://skyboundsolutions.com/boarding-pass/581rM', 1, 4, 32, 10),
('https://skyboundsolutions.com/boarding-pass/289FI', 1, 5, 11, 20),
('https://skyboundsolutions.com/boarding-pass/882GU', 0, 5, 12, 28),
('https://skyboundsolutions.com/boarding-pass/422Qi', 1, 3, 19, 36),
('https://skyboundsolutions.com/boarding-pass/263Nn', 0, 0, 6, 31),
('https://skyboundsolutions.com/boarding-pass/701LM', 1, 0, 22, 31),
('https://skyboundsolutions.com/boarding-pass/234vs', 0, 5, 14, 3),
('https://skyboundsolutions.com/boarding-pass/285oK', 0, 3, 35, 29),
('https://skyboundsolutions.com/boarding-pass/155yb', 0, 4, 25, 40),
('https://skyboundsolutions.com/boarding-pass/416ch', 1, 0, 39, 26),
('https://skyboundsolutions.com/boarding-pass/883mG', 1, 0, 11, 32),
('https://skyboundsolutions.com/boarding-pass/652Rf', 0, 0, 12, 15),
('https://skyboundsolutions.com/boarding-pass/882sQ', 1, 0, 35, 2),
('https://skyboundsolutions.com/boarding-pass/377Cl', 1, 5, 11, 10),
('https://skyboundsolutions.com/boarding-pass/504dr', 0, 0, 18, 33),
('https://skyboundsolutions.com/boarding-pass/781TZ', 1, 0, 7, 11),
('https://skyboundsolutions.com/boarding-pass/406Bt', 1, 0, 36, 33),
('https://skyboundsolutions.com/boarding-pass/701Nq', 1, 5, 30, 38),
('https://skyboundsolutions.com/boarding-pass/146Vv', 0, 1, 14, 29),
('https://skyboundsolutions.com/boarding-pass/756NV', 1, 2, 16, 36),
('https://skyboundsolutions.com/boarding-pass/530St', 0, 4, 21, 9),
('https://skyboundsolutions.com/boarding-pass/119jp', 0, 3, 21, 27);

INSERT INTO Business (Id, Name, Type, AirportCode)
VALUES
(1, 'The Corner Store', 'Electronics store', 'GNY'),
(2, 'Main Street Market', 'Electronics store', 'QCU'),
(3, 'City Center Boutique', 'Electronics store', 'AZI'),
(4, 'Sunset Plaza Shop', 'Bookstore', 'QCU'),
(5, 'Riverfront Emporium', 'Coffee shop', 'KAA'),
(6, 'Hilltop Crafts', 'Electronics store', 'NIS'),
(7, 'Harbor View Gifts', 'Duty-free shop', 'FGU'),
(8, 'Pine Street Pantry', 'Bookstore', 'GNY'),
(9, 'Maple Avenue Mercantile', 'Coffee shop', 'EYR'),
(10, 'Oakwood Outfitters', 'Electronics store', 'SBF'),
(11, 'Meadowbrook Mall', 'Electronics store', 'DBN'),
(12, 'Willow Way Wares', 'Electronics store', 'KNE'),
(13, 'Sunnyvale Supplies', 'Duty-free shop', 'AZI'),
(14, 'Golden Gate Gifts', 'Gift shop', 'SHR'),
(15, 'Mountain View Market', 'Coffee shop', 'QCU'),
(16, 'Lakeside Loft', 'Duty-free shop', 'AKG'),
(17, 'Valley Vista Variety', 'Electronics store', 'NIS'),
(18, 'Oceanfront Oasis', 'Coffee shop', 'TBT'),
(19, 'Parkside Provisions', 'Duty-free shop', 'NBB'),
(20, 'Riverside Retail', 'Electronics store', 'FGU'),
(21, 'The Corner Store', 'Bookstore', 'GOE'),
(22, 'Main Street Market', 'Electronics store', 'QFI'),
(23, 'City Center Boutique', 'Gift shop', 'PFO'),
(24, 'Sunset Plaza Shop', 'Duty-free shop', 'MDC'),
(25, 'Riverfront Emporium', 'Duty-free shop', 'SBF'),
(26, 'Hilltop Crafts', 'Electronics store', 'AWR'),
(27, 'Harbor View Gifts', 'Gift shop', 'SBF'),
(28, 'Pine Street Pantry', 'Bookstore', 'NIS'),
(29, 'Maple Avenue Mercantile', 'Coffee shop', 'EYR'),
(30, 'Oakwood Outfitters', 'Coffee shop', 'KAA'),
(31, 'Meadowbrook Mall', 'Electronics store', 'NBB'),
(32, 'Willow Way Wares', 'Coffee shop', 'AZI'),
(33, 'Sunnyvale Supplies', 'Coffee shop', 'GNY'),
(34, 'Golden Gate Gifts', 'Coffee shop', 'SBF'),
(35, 'Mountain View Market', 'Bookstore', 'MDC'),
(36, 'Lakeside Loft', 'Coffee shop', 'TUN'),
(37, 'Valley Vista Variety', 'Duty-free shop', 'YMK'),
(38, 'Oceanfront Oasis', 'Gift shop', 'MUC'),
(39, 'Parkside Provisions', 'Gift shop', 'QCU'),
(40, 'Riverside Retail', 'Gift shop', 'TBP');

INSERT INTO PassengerTravelAgent (PassengerId, TravelAgentId)
VALUES
(38 34),
(35 15),
(12 30),
(31 4),
(4 25),
(20 4),
(33 19),
(36 34),
(5 38),
(12 26),
(6 31),
(32 19),
(39 33),
(38 30),
(27 38),
(14 40),
(15 28),
(6 30),
(26 12),
(17 32),
(11 26),
(23 34),
(29 29),
(39 10),
(18 26),
(16 5),
(11 35),
(36 11),
(27 26),
(32 25),
(13 3),
(34 13),
(2 33),
(11 14),
(4 7),
(16 20),
(25 22),
(11 21),
(24 27),
(23 12),
(20 31),
(30 20),
(18 7),
(10 32),
(34 36),
(2 14),
(19 27),
(6 34),
(9 17),
(19 7),
(26 31),
(16 16),
(4 5),
(24 2),
(12 3),
(39 36),
(6 24),
(7 34),
(31 20),
(3 36),
(8 32),
(33 31),
(4 31),
(7 40),
(3 1),
(35 40),
(11 23),
(37 10),
(35 33),
(1 29),
(37 35),
(25 34),
(33 19),
(2 18),
(32 20),
(3 26),
(11 37),
(12 1),
(5 16),
(8 29),
(21 33),
(36 1),
(14 33),
(23 32),
(14 11),
(29 17),
(38 21),
(23 8),
(3 26),
(10 32),
(3 32),
(25 34),
(9 24),
(13 6),
(16 3),
(28 19),
(26 9),
(28 40),
(19 33),
(33 40),
(5 28),
(34 18),
(19 24),
(2 33),
(27 7),
(8 4),
(10 32),
(11 33),
(25 13),
(23 13),
(27 33),
(13 9),
(23 24),
(36 40),
(22 22),
(4 4),
(38 37),
(20 3),
(34 19),
(38 25),
(40 33),
(13 2),
(25 6),
(26 37),
(12 9);