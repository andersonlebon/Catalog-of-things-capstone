/* Database schema to keep the structure of entire database. */
CREATE DATABASE catalog_of_my_things;

CREATE TABLE item (
    item_id INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,	
    source_id INT,
    label_id INT,
    archived BOOLEAN,    
    publish_date DATE NOT NULL,
    UNIQUE (publish_date),
	FOREIGN KEY (genre_id) REFERENCES genre(genre_id), 
	FOREIGN KEY (author_id) REFERENCES author(author_id)
    FOREIGN KEY (source_id) REFERENCES source(source_id)
	FOREIGN KEY (label_id) REFERENCES label(label_id)
);

CREATE TABLE genre (
    genre_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY(id)
    );

CREATE TABLE author (
    author_id INT AUTO_INCREMENT,
    first_name VARCHAR(100),
    last_name VARCHAR(100),    
    PRIMARY KEY(author_id)
    );

CREATE TABLE source (
    source_id INT AUTO_INCREMENT,
    name VARCHAR(100),   
    PRIMARY KEY(source_id)
    );   

CREATE TABLE label (
    label_id INT AUTO_INCREMENT,
    title VARCHAR(100),
    color VARCHAR(100),    
    PRIMARY KEY(label_id)
    );   

CREATE TABLE book (
    publisher VARCHAR(100),
    cover_state VARCHAR(100),
    can_be_archived BOOLEAN,
);  

CREATE TABLE music_album (
    on_spotify BOOLEAN,
    can_be_archived BOOLEAN,
);  

CREATE TABLE movie (
    silet BOOLEAN,
    can_be_archived BOOLEAN,
);  

CREATE TABLE game (
    multiplayer BOOLEAN,
    last_played_at DATE NOT NULL,
    can_be_archived BOOLEAN,
);  