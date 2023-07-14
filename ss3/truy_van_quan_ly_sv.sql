CREATE DATABASE Student_management;
USE Student_management;

CREATE TABLE class
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    Status    BIT
);

CREATE TABLE students
(
    students_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    students_name VARCHAR(30) NOT NULL,
    address     VARCHAR(50),
    phone       VARCHAR(20),
    Status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
CREATE TABLE subjects
(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    students_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, students_id),
    FOREIGN KEY (sub_id) REFERENCES subjects (sub_id),
    FOREIGN KEY (students_id) REFERENCES students (students_id)
);
INSERT INTO class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO class
VALUES (3, 'B3', current_date, 0);

INSERT INTO students (students_name, address, phone, Status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO students (students_name, address, Status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO students (students_name, address, phone, Status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO mark (sub_id, students_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT *
FROM students 
WHERE students_name LIKE "H%";
 
SELECT * 
FROM class 
WHERE MONTH(start_date) = 12;  

SELECT * 
FROM subjects 
WHERE credit BETWEEN 3 AND 5; 

SET sql_safe_updates = 0;
UPDATE students
SET  class_id = 2
WHERE students_name = "Hung";
SET sql_safe_updates = 1;

SELECT  students_name, sub_name, mark
FROM students
inner join mark on students.students_id = mark.students_id
inner join subjects on mark.sub_id = subjects.sub_id
ORDER BY mark DESC, students_name ASC;
