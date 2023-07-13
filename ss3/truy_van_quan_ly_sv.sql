CREATE DATABASE QuanLySinhVien;
USE QuanLySinhVien;

CREATE TABLE Class
(
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    Status    BIT
);

CREATE TABLE Students
(
    Students_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Students_name VARCHAR(30) NOT NULL,
    Address     VARCHAR(50),
    Phone       VARCHAR(20),
    Status      BIT,
    class_id     INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES Class (class_id)
);
CREATE TABLE Subjects
(
    sub_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_name VARCHAR(30) NOT NULL,
    Credit  TINYINT     NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
    Status  BIT                  DEFAULT 1
);

CREATE TABLE Mark
(
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sub_id     INT NOT NULL,
    Students_id INT NOT NULL,
    Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (sub_id, Students_id),
    FOREIGN KEY (sub_id) REFERENCES Subjects (sub_id),
    FOREIGN KEY (Students_id) REFERENCES Students (Students_id)
);
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Students (Students_name, Address, Phone, Status, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Students (Students_name, Address, Status, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Students (Students_name, Address, Phone, Status, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subjects
VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);

INSERT INTO Mark (sub_id, Students_id, Mark, exam_times)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT *
FROM Students 
WHERE Students_name LIKE "H%";
 
SELECT * 
FROM Class 
WHERE MONTH(start_date) = 12;  

SELECT * 
FROM Subjects 
WHERE Credit BETWEEN 3 AND 5; 

SET sql_safe_updates = 0;
UPDATE Students
SET  class_id = 2
WHERE Students_name = "Hung";
SET sql_safe_updates = 1;

SELECT  Students_name, sub_name, Mark
FROM Students
inner join Mark on Students.Students_id = Mark.Students_id
inner join Subjects on Mark.sub_id = Subjects.sub_id
ORDER BY Mark DESC, Students_name ASC;
