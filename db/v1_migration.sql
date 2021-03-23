CREATE DATABASE IF NOT EXISTS catalog;

CREATE TABLE IF NOT EXISTS catalog.people(
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(32) NOT NULL,
    PRIMARY KEY(id)
);

INSERT INTO catalog.people (name) VALUES ("Jhon Doe"), 
    ("Mary Sue"), 
    ("Michael Demo"), 
    ("Lou Snyder");