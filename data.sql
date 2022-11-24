INSERT INTO person(ssn, name, street, zip, city, mail)
VALUES
('197001011234', 'Edwin Ahlstrand', 'Vägen1', '123 45', 'Stockholm', 'edwinahl@kth.se'),
('198401011234', 'Baltzar Lagerros', 'Vägen2', '987 65', 'Borås', 'baltzarl@kth.se'),
('201401011234','Medge Francis','Ap #381-534 Orci Rd.','88-455','Port Blair','fringilla@google.edu'),
('199401011234','Palmer Gay','Ap #810-4547 Bibendum Road','87882','Mastung','et.libero@outlook.couk');

INSERT INTO phone(phone_no)
VALUES
('1-873-883-0217'),
('(211) 613-7391'),
('1-355-932-3693'),
('(861) 634-8528');

INSERT INTO person_phone(person_id, phone_id)
VALUES

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