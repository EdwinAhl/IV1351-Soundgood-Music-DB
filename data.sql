INSERT INTO person(ssn, name, street, zip, city, mail)
VALUES
('197001011234', 'Edwin Ahlstrand', 'Vägen1', '123 45', 'Stockholm', 'edwinahl@kth.se'),
('198401011234', 'Baltzar Lagerros', 'Vägen2', '987 65', 'Borås', 'baltzarl@kth.se'),
('201401011234','Medge Francis','Ap #381-534 Orci Rd.','88-455','Port Blair','fringilla@google.edu'),
('199401011234','Palmer Gay','Ap #810-4547 Bibendum Road','87882','Mastung','et.libero@outlook.couk');
('199601011234','Emmanuel Higgins','464-5072 Aliquet Rd.','90246','Stellenbosch','nec.metus.facilisis@protonmail.com'),
('202001011234','Wyatt Barker','Ap #380-7152 Sit St.','61418','Aisén','dolor.fusce@outlook.com'),
('202001011234','Iris Lott','Ap #996-5511 Facilisis Av.','13516','Bhiwani','vehicula@icloud.org'),
('200401011234','Kirsten Peterson','Ap #938-2688 Nunc St.','650117','Devonport','risus.odio.auctor@yahoo.com'),
('200301011234','Odessa Austin','P.O. Box 460, 6293 Donec St.','563248','Mâcon','enim@aol.ca');

INSERT INTO phone(phone_no)
VALUES
('1-873-883-0217'),
('(211) 613-7391'),
('1-355-932-3693'),
('(861) 634-8528'),
('(918) 780-1939'),
('(971) 664-7537'),
('1-651-497-1123'),
('1-743-678-2647'),

INSERT INTO person_phone(person_id, phone_id)
VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(4, 6);


INSERT INTO instructor(person_id, skill, instrument, available)
VALUES

INSERT INTO student(person_id, skill, instrument_to_learn)
VALUES

INSERT INTO sibling_student(id, student_id)
VALUES

INSERT INTO lease(student_id, period)
VALUES

INSERT INTO rentable_instrument(lease_id, price, quality, brand)
VALUES

INSERT INTO price(difficulty, base_price)
VALUES

INSERT INTO individual_lesson(instructor_id, difficulty, instrument, date)
VALUES

INSERT INTO group_lesson(instructor_id, difficulty, instrument, min_students, max_students, period)
VALUES

INSERT INTO ensamble(instructor_id, difficulty, instrument, min_students, max_students, period, genre)
VALUES