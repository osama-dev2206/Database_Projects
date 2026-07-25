-- ============================================================
--  Karate Club — DML Insert Script
--  Insertion order respects FK dependencies:
--  Persons -> BeltRanks -> Members -> Instructors
--  -> Emails -> Phones -> Qualifications -> Payments
--  -> MemberInstructors -> Subscriptions -> BeltTests
-- ============================================================

-- USE KarateClubDB;  -- uncomment and change to your database name
-- GO

-- ─────────────────────────────────────────────────────────────
-- 1. PERSONS  (10 people)
--    PersonId 1-3  → will become Instructors
--    PersonId 4-10 → will become Members
-- ─────────────────────────────────────────────────────────────
INSERT INTO Persons (Name, Address) VALUES
('Ahmed Al-Rashid',   '12 Nile Street, Cairo'),
('Sara El-Masry',     '45 Zamalek Ave, Cairo'),
('Omar Khaled',       '88 Corniche Road, Alexandria'),
('Layla Hassan',      '7 Tahrir Square, Cairo'),
('Youssef Nabil',     '33 Victory Street, Giza'),
('Nour Ibrahim',      '19 Pyramids Road, Giza'),
('Karim Samir',       '5 Salah Salem, Cairo'),
('Dina Mahmoud',      '61 Mohandessin St, Cairo'),
('Tarek Fouad',       '22 Heliopolis Ave, Cairo'),
('Mariam Adel',       '4 Maadi Corniche, Cairo');


-- ─────────────────────────────────────────────────────────────
-- 2. BELT RANKS
-- ─────────────────────────────────────────────────────────────
INSERT INTO BeltRanks (BeltRankName, TestFee) VALUES
('White Belt',   50.00),   -- BeltRankId = 1
('Yellow Belt',  75.00),   -- BeltRankId = 2
('Orange Belt',  100.00),  -- BeltRankId = 3
('Green Belt',   125.00),  -- BeltRankId = 4
('Blue Belt',    150.00),  -- BeltRankId = 5
('Brown Belt',   175.00),  -- BeltRankId = 6
('Black Belt',   250.00);  -- BeltRankId = 7


-- ─────────────────────────────────────────────────────────────
-- 3. MEMBERS  (IS-A Person: PersonId 4 to 10)
-- ─────────────────────────────────────────────────────────────
INSERT INTO Members (MemberPersonId, EmergencyContactName, IsActive, BeltRankId) VALUES
(4,  'Hassan Ibrahim',  1, 3),   -- MemberId=1  Layla   → Orange Belt
(5,  'Rania Nabil',     1, 2),   -- MemberId=2  Youssef → Yellow Belt
(6,  'Samira Kamal',    1, 4),   -- MemberId=3  Nour    → Green Belt
(7,  'Tarek Samir',     1, 1),   -- MemberId=4  Karim   → White Belt
(8,  'Hoda Mansour',    1, 5),   -- MemberId=5  Dina    → Blue Belt
(9,  'Amal Fouad',      0, 6),   -- MemberId=6  Tarek   → Brown Belt (inactive)
(10, 'Yasser Adel',     1, 2);   -- MemberId=7  Mariam  → Yellow Belt


-- ─────────────────────────────────────────────────────────────
-- 4. INSTRUCTORS  (IS-A Person: PersonId 1 to 3)
-- ─────────────────────────────────────────────────────────────
INSERT INTO Instructors (PersonInstructorId) VALUES
(1),   -- InstructorId=1  Ahmed
(2),   -- InstructorId=2  Sara
(3);   -- InstructorId=3  Omar


-- ─────────────────────────────────────────────────────────────
-- 5. EMAILS  (FK -> Persons)
-- ─────────────────────────────────────────────────────────────
INSERT INTO Emails (EmailAddress, PersonEmailId) VALUES
('ahmed.rashid@karate.eg',   1),
('sara.masry@karate.eg',     2),
('omar.khaled@karate.eg',    3),
('layla.hassan@gmail.com',   4),
('youssef.nabil@gmail.com',  5),
('nour.ibrahim@hotmail.com', 6),
('karim.samir@yahoo.com',    7),
('dina.mahmoud@gmail.com',   8),
('tarek.fouad@hotmail.com',  9),
('mariam.adel@gmail.com',    10);


-- ─────────────────────────────────────────────────────────────
-- 6. PHONES  (FK -> Persons)
-- ─────────────────────────────────────────────────────────────
INSERT INTO Phones (PhoneNumber, PersonPhoneId) VALUES
('+20 100 1234567', 1),
('+20 100 2345678', 2),
('+20 101 3456789', 3),
('+20 101 4567890', 4),
('+20 102 5678901', 5),
('+20 102 6789012', 6),
('+20 103 7890123', 7),
('+20 103 8901234', 8),
('+20 106 9012345', 9),
('+20 106 0123456', 10);


-- ─────────────────────────────────────────────────────────────
-- 7. QUALIFICATIONS  (FK -> Instructors)
-- ─────────────────────────────────────────────────────────────
INSERT INTO Qualifications (InstructorQualificationId, QualificationName) VALUES
(1, '3rd Dan Black Belt'),
(1, 'WKF Certified Coach'),
(2, '2nd Dan Black Belt'),
(2, 'National Referee License'),
(3, '1st Dan Black Belt'),
(3, 'Junior Instructor Certificate');


-- ─────────────────────────────────────────────────────────────
-- 8. PAYMENTS  (must be inserted BEFORE Subscriptions & BeltTests)
--    PaymentStatus: 1 = Paid,  0 = Pending
-- ─────────────────────────────────────────────────────────────
INSERT INTO Payments (Amount, Date, PaymentStatus, PMemberId) VALUES
-- Subscription payments
(500.00, '2025-01-01', 1, 1),   -- PaymentId=1   Layla subscription
(500.00, '2025-01-05', 1, 2),   -- PaymentId=2   Youssef subscription
(500.00, '2025-01-10', 1, 3),   -- PaymentId=3   Nour subscription
(500.00, '2025-02-01', 1, 4),   -- PaymentId=4   Karim subscription
(500.00, '2025-02-05', 1, 5),   -- PaymentId=5   Dina subscription
(500.00, '2025-02-10', 0, 6),   -- PaymentId=6   Tarek subscription (pending)
(500.00, '2025-03-01', 1, 7),   -- PaymentId=7   Mariam subscription
-- Belt test payments
(100.00, '2025-03-15', 1, 1),   -- PaymentId=8   Layla belt test
(75.00,  '2025-03-15', 1, 2),   -- PaymentId=9   Youssef belt test
(125.00, '2025-04-01', 1, 3),   -- PaymentId=10  Nour belt test
(150.00, '2025-04-01', 1, 5),   -- PaymentId=11  Dina belt test
(175.00, '2025-04-10', 0, 6);   -- PaymentId=12  Tarek belt test (pending)


-- ─────────────────────────────────────────────────────────────
-- 9. MEMBER INSTRUCTORS  (junction: Members <-> Instructors)
--    UNIQUE(M_MemberId, M_InstructorId) constraint enforced
-- ─────────────────────────────────────────────────────────────
INSERT INTO MemberInstructors (M_MemberId, M_InstructorId, AssignDate) VALUES
(1, 1, '2025-01-02'),   -- Layla   trains with Ahmed
(2, 1, '2025-01-06'),   -- Youssef trains with Ahmed
(3, 2, '2025-01-11'),   -- Nour    trains with Sara
(4, 2, '2025-02-02'),   -- Karim   trains with Sara
(5, 3, '2025-02-06'),   -- Dina    trains with Omar
(6, 3, '2025-02-11'),   -- Tarek   trains with Omar
(7, 1, '2025-03-02');   -- Mariam  trains with Ahmed


-- ─────────────────────────────────────────────────────────────
-- 10. SUBSCRIPTIONS  (FK -> Members + Payments)
-- ─────────────────────────────────────────────────────────────
INSERT INTO Subscriptions (StartDate, EndDate, Fees, MemberShipStatus, SMemberId, SPaymentId) VALUES
('2025-01-01', '2025-06-30', 500, 1, 1, 1),  -- Layla    active  (paid)
('2025-01-05', '2025-07-04', 500, 1, 2, 2),  -- Youssef  active  (paid)
('2025-01-10', '2025-07-09', 500, 1, 3, 3),  -- Nour     active  (paid)
('2025-02-01', '2025-07-31', 500, 1, 4, 4),  -- Karim    active  (paid)
('2025-02-05', '2025-08-04', 500, 1, 5, 5),  -- Dina     active  (paid)
('2025-02-10', NULL,         500, 0, 6, 6),  -- Tarek    inactive (payment pending)
('2025-03-01', '2025-08-31', 500, 1, 7, 7);  -- Mariam   active  (paid)


-- ─────────────────────────────────────────────────────────────
-- 11. BELT TESTS  (FK -> Instructors, BeltRanks, Members, Payments)
--     TestedByInstructorId, TargetRankId, MemberTestedId are nullable
-- ─────────────────────────────────────────────────────────────
INSERT INTO BeltTests (Result, TestDate, TestedByInstructorId, TargetRankId, MemberTestedId, TestPaymentId) VALUES
('Pass',    '2025-03-20', 1, 4, 1,  8),  -- Layla   tested by Ahmed → Green Belt    PASS
('Pass',    '2025-03-20', 1, 3, 2,  9),  -- Youssef tested by Ahmed → Orange Belt   PASS
('Pass',    '2025-04-05', 2, 5, 3, 10),  -- Nour    tested by Sara  → Blue Belt     PASS
('Fail',    '2025-04-05', 3, 7, 5, 11),  -- Dina    tested by Omar  → Black Belt    FAIL
('Pending', '2025-04-15', 3, 7, 6, 12);  -- Tarek   tested by Omar  → Black Belt    PENDING


-- ─────────────────────────────────────────────────────────────
-- VERIFICATION: Row count per table
-- ─────────────────────────────────────────────────────────────
SELECT 'Persons'           AS TableName, COUNT(*) AS Row_Count FROM Persons         UNION ALL
SELECT 'BeltRanks',                      COUNT(*)             FROM BeltRanks        UNION ALL
SELECT 'Members',                        COUNT(*)             FROM Members           UNION ALL
SELECT 'Instructors',                    COUNT(*)             FROM Instructors       UNION ALL
SELECT 'Emails',                         COUNT(*)             FROM Emails            UNION ALL
SELECT 'Phones',                         COUNT(*)             FROM Phones            UNION ALL
SELECT 'Qualifications',                 COUNT(*)             FROM Qualifications    UNION ALL
SELECT 'Payments',                       COUNT(*)             FROM Payments          UNION ALL
SELECT 'MemberInstructors',              COUNT(*)             FROM MemberInstructors UNION ALL
SELECT 'Subscriptions',                  COUNT(*)             FROM Subscriptions     UNION ALL
SELECT 'BeltTests',                      COUNT(*)             FROM BeltTests;


