CREATE TABLE user (
id VARCHAR (21) NOT NULL PRIMARY KEY,
person_id VARCHAR(21),
name VARCHAR (50)NOT NULL,
email VARCHAR (100) NOT NULL UNIQUE,
password VARCHAR (60) NOT NULL,
last_login DATETIME NULL DEFAULT NULL
);

CREATE TABLE person (
id VARCHAR(21) NOT NULL PRIMARY KEY,
user_id VARCHAR(21) NOT NULL,
name VARCHAR(50) NOT NULL,
birth_date DATE,
death_date DATE, 
birth_town VARCHAR(50),
bio VARCHAR(500)
);

CREATE TABLE image (
id VARCHAR(21) NOT NULL PRIMARY KEY, 
user_id VARCHAR(21) NOT NULL,
person_id VARCHAR(21),
url VARCHAR(248),
FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE person_person (
root_person VARCHAR(21) NOT NULL,
related_person VARCHAR(21) NOT NULL, 
relationship VARCHAR(50) NOT NULL,
PRIMARY KEY (root_person, related_person),
FOREIGN KEY (root_person) REFERENCES person(id),
FOREIGN KEY (related_person) REFERENCES person(id)
);

CREATE TABLE person_image(
root_person VARCHAR(21) NOT NULL,
related_image VARCHAR(21) NOT NULL,
PRIMARY KEY (root_person, related_image),
FOREIGN KEY (root_person) REFERENCES person(id),
FOREIGN KEY (related_image) REFERENCES image(id)
);

CREATE TABLE blog (
id VARCHAR (21) NOT NULL PRIMARY KEY,
user_id VARCHAR(21),
header VARCHAR(50) NOT NULL,
body VARCHAR(5000),
image_url VARCHAR(248),
FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE
);

CREATE TABLE blog_comments (
id VARCHAR (21) NOT NULL PRIMARY KEY,
user_id VARCHAR(21),
name VARCHAR(50) NOT NULL,
blog_id VARCHAR(21),
body VARCHAR(500) NOT NULL,
update_dt DATETIME NULL DEFAULT NULL,
FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
FOREIGN KEY (blog_id) REFERENCES blog(id) ON DELETE CASCADE
);

CREATE TABLE session (
id VARCHAR(21) NOT NULL PRIMARY KEY,
user_id VARCHAR(21) NOT NULL,
FOREIGN KEY (user_id) REFERENCES user(id)
);


ALTER TABLE user
ADD CONSTRAINT fk_person FOREIGN KEY (person_id) REFERENCES person(id);











