CREATE TABLE db_iemr.usertoc (
    id INT PRIMARY KEY AUTO_INCREMENT,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    salary DOUBLE NOT NULL,
    companyName VARCHAR(255) NOT NULL,
    isExist BOOLEAN NOT NULL
);