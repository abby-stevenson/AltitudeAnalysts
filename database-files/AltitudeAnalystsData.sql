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
(1, '14:30:00', '11:00:00', '2025-03-30', 'A', 'A1', 150, 300, 180, 1, 'BOS', 'LHR', 1, 2),
(2, '16:45:00', '13:30:00', '2025-03-30', 'B', 'B3', 180, 350, 210, 2, 'LHR', 'LTN', 2, 1),
(3, '09:00:00', '06:30:00', '2025-03-30', 'C', 'C5', 120, 250, 120, 3, 'LTN', 'BOS', 1, 2);

INSERT INTO AirportManager (Id, FirstName, LastName, AirportCode)
VALUES
(1, 'Lena', 'Marshall', 'BOS'),
(2, 'Damien', 'Cruz', 'LHR'),
(3, 'Avery', 'Thornton', 'LTN');

INSERT INTO Tracks (FlightNumber, AirportManagerID)
VALUES
(1, 1),
(2, 2),
(3, 3);

INSERT INTO Seat (Available, Class, FlightNumber, SeatNumber)
VALUES
(0, 'Economy', 1, 1),
(1, 'Business', 2, 2),
(1, 'Economy', 1, 3);

INSERT INTO Passenger (FirstName, LastName, DOB, Email, Id)
VALUES
('John', 'Doe', '1985-06-15', 'john.doe@example.com', 1),
('Jane', 'Smith', '1990-02-20', 'jane.smith@example.com', 2),
('Emily', 'Johnson', '1992-11-11', 'emily.johnson@example.com', 3);

INSERT INTO Booked (BoardingPass, Amenities, Luggage, FlightNumber, PassengerId)
VALUES
('https://example.com/boarding-pass/101-JD', 1, 2, 1, 1),
('https://example.com/boarding-pass/102-JS', 0, 1, 2, 2),
('https://example.com/boarding-pass/103-EJ', 1, 3, 3, 3);

INSERT INTO Business (Id, Name, Type, AirportCode)
VALUES
(1, 'LoganEats', 'Dining', 'BOS'),
(2, 'HeathrowShops', 'GiftShop', 'LHR'),
(3, 'LutonMedicates', 'Pharmacy', 'LTN');

INSERT INTO PassengerTravelAgent (PassengerId, TravelAgentId)
VALUES
(1, 1),
(2, 1),
(3, 3);
