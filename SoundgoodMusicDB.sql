CREATE TABLE person (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 ssn UNIQUE VARCHAR(12) NOT NULL,
 name VARCHAR(100) NOT NULL,
 street VARCHAR(100) NOT NULL,
 zip VARCHAR(100) NOT NULL,
 city VARCHAR(100) NOT NULL,
 phone VARCHAR(11) NOT NULL,
 mail VARCHAR(100) NOT NULL
);

ALTER TABLE person ADD CONSTRAINT PK_person PRIMARY KEY (id);


CREATE TABLE phone (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_no VARCHAR(100)
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (id);


CREATE TABLE price (
 difficulty VARCHAR(100) NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 basePrice INT NOT NULL
);

ALTER TABLE price ADD CONSTRAINT PK_price PRIMARY KEY (difficulty,lesson_type);


CREATE TABLE student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill VARCHAR(100),
 instrumentToLearn VARCHAR(100)
);

ALTER TABLE student ADD CONSTRAINT PK_student PRIMARY KEY (id);


CREATE TABLE booking (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE booking ADD CONSTRAINT PK_booking PRIMARY KEY (id,student_id);


CREATE TABLE instructor (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 skill VARCHAR(100) NOT NULL,
 instrument VARCHAR(100) NOT NULL,
 available INTERVAL(100)
);

ALTER TABLE instructor ADD CONSTRAINT PK_instructor PRIMARY KEY (id);


CREATE TABLE lease (
 id INT NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 period INTERVAL(100) NOT NULL
);

ALTER TABLE lease ADD CONSTRAINT PK_lease PRIMARY KEY (id,student_id);


CREATE TABLE lesson (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 booking_id INT GENERATED ALWAYS AS IDENTITY,
 student_id INT GENERATED ALWAYS AS IDENTITY,
 instructor_id INT GENERATED ALWAYS AS IDENTITY,
 difficulty VARCHAR(100) NOT NULL,
 lesson_type VARCHAR(100) NOT NULL,
 instrument VARCHAR(100) NOT NULL
);

ALTER TABLE lesson ADD CONSTRAINT PK_lesson PRIMARY KEY (id);


CREATE TABLE person_phone (
 person_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 phone_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE person_phone ADD CONSTRAINT PK_person_phone PRIMARY KEY (person_id,phone_id);


CREATE TABLE rentable_instrument (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 lease_id INT,
 student_id INT GENERATED ALWAYS AS IDENTITY,
 price INT NOT NULL,
 quality VARCHAR(100) NOT NULL,
 brand VARCHAR(100)
);

ALTER TABLE rentable_instrument ADD CONSTRAINT PK_rentable_instrument PRIMARY KEY (id);


CREATE TABLE sibling_student (
 id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 student_id INT GENERATED ALWAYS AS IDENTITY NOT NULL
);

ALTER TABLE sibling_student ADD CONSTRAINT PK_sibling_student PRIMARY KEY (id,student_id);


CREATE TABLE group_lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 minStudents VARCHAR(100) NOT NULL,
 maxStudents VARCHAR(100) NOT NULL,
 period INTERVAL(100) NOT NULL
);

ALTER TABLE group_lesson ADD CONSTRAINT PK_group_lesson PRIMARY KEY (lesson_id);


CREATE TABLE individual_lesson (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 date DATE NOT NULL
);

ALTER TABLE individual_lesson ADD CONSTRAINT PK_individual_lesson PRIMARY KEY (lesson_id);


CREATE TABLE ensamble (
 lesson_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 genre VARCHAR(100)
);

ALTER TABLE ensamble ADD CONSTRAINT PK_ensamble PRIMARY KEY (lesson_id);


ALTER TABLE student ADD CONSTRAINT FK_student_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE booking ADD CONSTRAINT FK_booking_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE instructor ADD CONSTRAINT FK_instructor_0 FOREIGN KEY (person_id) REFERENCES person (id);


ALTER TABLE lease ADD CONSTRAINT FK_lease_0 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE lesson ADD CONSTRAINT FK_lesson_0 FOREIGN KEY (booking_id,student_id) REFERENCES booking (id,student_id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_1 FOREIGN KEY (instructor_id) REFERENCES instructor (id);
ALTER TABLE lesson ADD CONSTRAINT FK_lesson_2 FOREIGN KEY (difficulty,lesson_type) REFERENCES price (difficulty,lesson_type);


ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_0 FOREIGN KEY (person_id) REFERENCES person (id);
ALTER TABLE person_phone ADD CONSTRAINT FK_person_phone_1 FOREIGN KEY (phone_id) REFERENCES phone (id);


ALTER TABLE rentable_instrument ADD CONSTRAINT FK_rentable_instrument_0 FOREIGN KEY (lease_id,student_id) REFERENCES lease (id,student_id);


ALTER TABLE sibling_student ADD CONSTRAINT FK_sibling_student_0 FOREIGN KEY (id) REFERENCES student (id);
ALTER TABLE sibling_student ADD CONSTRAINT FK_sibling_student_1 FOREIGN KEY (student_id) REFERENCES student (id);


ALTER TABLE group_lesson ADD CONSTRAINT FK_group_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE individual_lesson ADD CONSTRAINT FK_individual_lesson_0 FOREIGN KEY (lesson_id) REFERENCES lesson (id);


ALTER TABLE ensamble ADD CONSTRAINT FK_ensamble_0 FOREIGN KEY (lesson_id) REFERENCES group_lesson (lesson_id);


