DROP TABLE IF EXISTS book_has_author;
DROP TABLE IF EXISTS book_instance;
DROP TABLE IF EXISTS edition;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;

CREATE TABLE book (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255)
) ENGINE INNODB;

CREATE TABLE edition (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  year SMALLINT,
  title VARCHAR(255),
  isbn VARCHAR(255),
  FOREIGN KEY fk_edition_book (book_id) REFERENCES book (id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE book_instance (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  edition_id INT NOT NULL,
  FOREIGN KEY fk_instance_edition (edition_id) REFERENCES edition (id) ON UPDATE CASCADE ON DELETE RESTRICT
) ENGINE INNODB;

CREATE TABLE author (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255)
) ENGINE INNODB;

CREATE TABLE book_has_author (
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  book_id INT NOT NULL,
  author_id INT NOT NULL,
  UNIQUE (book_id, author_id),
  CONSTRAINT FOREIGN KEY fk_book (book_id) REFERENCES book (id) ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT FOREIGN KEY fk_author (author_id) REFERENCES author (id) ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE INNODB;
