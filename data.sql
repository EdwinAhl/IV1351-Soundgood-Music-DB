INSERT INTO person(ssn, name, street, zip, city, mail, student_id)
VALUES
('197001011234', 'Edwin Ahlstrand', 'Vägen1', '123 45', 'Stockholm', 'edwinahl@kth.se', 1),
('198401011234', 'Baltzar Lagerros', 'Vägen2', '987 65', 'Borås', 'baltzarl@kth.se', 2),
('201401011234','Medge Francis','Ap #381-534 Orci Rd.','88-455','Port Blair','fringilla@google.edu', NULL),
('199401011234','Palmer Gay','Ap #810-4547 Bibendum Road','87882','Mastung','et.libero@outlook.couk', NULL);
('199601011234','Emmanuel Higgins','464-5072 Aliquet Rd.','90246','Stellenbosch','nec.metus.facilisis@protonmail.com', NULL),
('202001011234','Wyatt Barker','Ap #380-7152 Sit St.','61418','Aisén','dolor.fusce@outlook.com', NULL),
('202001011234','Iris Lott','Ap #996-5511 Facilisis Av.','13516','Bhiwani','vehicula@icloud.org', NULL),
('200401011234','Kirsten Peterson','Ap #938-2688 Nunc St.','650117','Devonport','risus.odio.auctor@yahoo.com', NULL);

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
(3, 'Easy', 'Guitar', 2022-11-24, 2022-12-23),
(4, 'Intermediate', 'Piano', 2022-01-15, 2022-06-14),
(5, 'Advanced', 'Drums', 2023-01-01, 2023-03-15);

INSERT INTO student(person_id, skill, instrument_to_learn)
VALUES
(6, 'Easy', 'Guitar'),
(7, 'Intermediate', 'Piano'),
(8, 'Advanced', 'Drums'),

INSERT INTO sibling_student(student_id1, student_id2)
VALUES
(6,7);

INSERT INTO lease(student_id, start_day, end_day)
VALUES
(8, 2022-11-24, 2022-12-24);



INSERT INTO rentable_instrument(type, price, quality, brand, lease_id)
VALUES
('Guitar', 120, 'OK', 'Harley Benton'),
('Piano', 200, 'Very good', 'Roland'),
('Drums', 200, 'Well used', 'Ludwig', 1);

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
('Advanced', 'Ensamble', 275),

INSERT INTO lesson(instructor_id, difficulty, lesson_type, instrument)
VALUES
(1, 'Easy', 'Individual', 'Guitar'),
(2, 'Intermediate', 'Group', 'Piano'),
(3, 'Advanced', 'Ensamble', 'Drums');


INSERT INTO group_lesson(lesson_id, min_students, max_students, start_time, end_time)
VALUES
(2, 10, 100, '2020-03-23 13:00', '2020-03-23 15:00'),
(3, 10, 100, '2020-03-21 12:00', '2020-03-23 14:00');

INSERT INTO individual_lesson(lesson_id, start_time)
VALUES
(1, 10, 100, '2020-03-23 13:00', '2020-03-24 16:00');

INSERT INTO ensamble(lesson_id, genre)
VALUES
(3, 10, 100, 'Classical');

INSERT INTO student_lesson(student_id, lesson_id)
VALUES
(1,1);
(1,2);
(1,3);
(2,3);