INSERT INTO person(ssn, name, street, zip, city, mail, student_id)
VALUES
--Contact person (creators)
('197001011234', 'Edwin Ahlstrand', 'Vagen1', '123 45', 'Stockholm', 'edwinahl@kth.se', NULL),
('198401011234', 'Baltzar Lagerros', 'Vagen2', '987 65', 'Borås', 'baltzarl@kth.se', NULL),
--Instructors
('201401011234','Medge Francis','Ap #381-534 Orci Rd.','88-455','Port Blair','fringilla@google.edu', NULL),
('199401011234','Palmer Gay','Ap #810-4547 Bibendum Road','87882','Mastung','et.libero@outlook.couk', NULL),
('199601011234','Emmanuel Higgins','464-5072 Aliquet Rd.','90246','Stellenbosch','nec.metus.facilisis@protonmail.com', NULL),
--Students
('202001011234','Wyatt Barker','Ap #380-7152 Sit St.','61418','Aisén','dolor.fusce@outlook.com', NULL),
('202001011234','Iris Lott','Ap #996-5511 Facilisis Av.','13516','Bhiwani','vehicula@icloud.org', NULL),
('200401011234','Kirsten Peterson','Ap #938-2688 Nunc St.','650117','Devonport','risus.odio.auctor@yahoo.com', NULL),
('197401011234','Castor Singleton','608-8657 Egestas. Rd.','97024','Namen','luctus.felis@aol.com', NULL),
('201301011234','Conan Conrad','Ap #821-3487 Netus Rd.','M54 1NB','Ceará','sit@icloud.com', NULL),
('200101011234','Carla Ortiz','Ap #227-9009 Facilisis. Rd.','21414','Anambra','lacus.cras@aol.couk', NULL),
('198401011234','Colette Wilkins','968 Turpis. Rd.','19712','Trentino-Alto Adige','cras@aol.org', NULL),
('200801011234','Erin Dudley','4094 Eu Av.','2867','Rio de Janeiro','amet.massa@outlook.org', NULL),
('197401011234','Boa Walker','774-4306 Massa St.','8254','South Island','sem.ut@aol.edu', NULL),
('197301011234','Harding Hodge','P.O. Box 483, 195 Tincidunt St.','86280','Midi-Pyrénées','cursus.et@aol.org', NULL),
('200701011234','Ursula Reynolds','533-575 Non, Rd.','90582','Pernambuco','elit@outlook.org', NULL);

INSERT INTO student(person_id, skill, instrument_to_learn)
VALUES
(6, 'Easy', 'Guitar'),
(7, 'Intermediate', 'Piano'),
(8, 'Advanced', 'Drums'),
(9, 'Easy', 'Drums'),
(10, 'Easy', 'Piano'),
(11, 'Easy', 'Tambourine'),
(12, 'Intermediate', 'Drums'),
(13, 'Intermediate', 'Guitar'),
(14, 'Intermediate', 'Guitar'),
(15, 'Advanced', 'Guitar'),
(16, 'Advanced', 'Piano');

UPDATE person
SET student_id = 1
WHERE id = 6;

UPDATE person
SET student_id = 2
WHERE id = 7;

UPDATE person
SET student_id = 3
WHERE id = 8;

UPDATE person
SET student_id = 4
WHERE id = 9;

UPDATE person
SET student_id = 5
WHERE id = 10;

UPDATE person
SET student_id = 6
WHERE id = 11;

UPDATE person
SET student_id = 7
WHERE id = 12;

UPDATE person
SET student_id = 8
WHERE id = 13;

UPDATE person
SET student_id = 9
WHERE id = 14;

UPDATE person
SET student_id = 10
WHERE id = 15;

UPDATE person
SET student_id = 11
WHERE id = 16;

INSERT INTO phone(phone_no)
VALUES
('1-873-883-0217'),
('(211) 613-7391'),
('1-355-932-3693'),
('(861) 634-8528'),
('(918) 780-1939'),
('(971) 664-7537'),
('1-651-497-1123'),
('1-743-678-2647');

INSERT INTO person_phone(person_id, phone_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6);

INSERT INTO instructor(person_id, skill, instrument, available_from, available_to)
VALUES
(3, 'Easy', 'Guitar', '2022-11-24', '2022-12-23'), -- Medge
(4, 'Intermediate', 'Piano', '2022-01-15', '2022-06-14'), -- Palmer
(5, 'Advanced', 'Drums', '2023-01-01', '2023-03-15'); -- Emmanuel

INSERT INTO sibling_student(student_id1, student_id2)
VALUES
--1,2,3
(1,2),
(2,1),
(1,3),
(3,1),
(2,3),
(3,2),
(4,5),
(5,4);

INSERT INTO lease(student_id, instrument_id, start_day, end_day)
VALUES
(2, NULL, '2022-11-24', '2022-12-24');

INSERT INTO rentable_instrument(type, price, quality, brand)
VALUES
('Guitar', 120, 'OK', 'Harley Benton'),
('Piano', 200, 'Very good', 'Roland'),
('Drums', 200, 'Well used', 'Ludwig');

UPDATE lease
SET instrument_id = 3
WHERE id = 1;


INSERT INTO price(difficulty, lesson_type, base_price)
VALUES
('Easy', 'Individual', 100),
('Easy', 'Group', 50),
('Easy', 'Ensamble', 75),

('Intermediate', 'Individual', 200),
('Intermediate', 'Group', 150),
('Intermediate', 'Ensamble', 175),

('Advanced', 'Individual', 300),
('Advanced', 'Group', 250),
('Advanced', 'Ensamble', 275);

INSERT INTO lesson(instructor_id, difficulty, lesson_type, instrument)
VALUES
(1, 'Easy', 'Individual', 'Guitar'), --1
(2, 'Intermediate', 'Group', 'Piano'), --2
(3, 'Intermediate', 'Ensamble', 'Drums'), --3
(3, 'Advanced', 'Group', 'Drums'), --4
(3, 'Easy', 'Group', 'Drums'), --5
(2, 'Advanced', 'Individual', 'Tambourine'), --6
(1, 'Easy', 'Individual', 'Tambourine'), --7
(1, 'Easy', 'Ensamble', 'Drums'), --8
(1, 'Easy', 'Ensamble', 'Drums'); --9


INSERT INTO group_lesson(lesson_id, min_students, max_students, start_time, end_time)
VALUES
(2, 10, 100, '2020-03-23 13:00', '2020-03-23 15:00'),
(4, 10, 100, '2020-04-04 10:00', '2020-04-04 11:00'),
(5, 50, 110, '2020-03-19 9:00', '2020-03-19 13:00'),
(9, 50, 110, '2022-12-07 9:00', '2022-12-07 9:00'),
(8, 50, 20, '2022-12-12 9:00', '2022-12-12 9:00'),
(3, 10, 100, '2020-03-21 12:00', '2020-03-23 14:00');

INSERT INTO individual_lesson(lesson_id, start_time)
VALUES
(1, '2020-03-23 13:00'),
(6, '2020-04-01 11:00'),
(7, '2020-02-07 15:30');

INSERT INTO ensamble(lesson_id, genre)
VALUES
(3, 'Classical'),
(8, 'Pop'),
(9, 'Rock');

INSERT INTO student_lesson(student_id, lesson_id)
VALUES
(1,1),
(1,2),
(1,3),
(2,3),
(3,3);