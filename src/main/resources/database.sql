-- init db

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS user_roles;
DROP TABLE IF EXISTS points;

DROP SEQUENCE IF EXISTS glob_seq;
DROP SEQUENCE IF EXISTS hibernate_sequence;

CREATE SEQUENCE glob_seq START 100000;
CREATE SEQUENCE hibernate_sequence START 1;

-- Table "users"
CREATE TABLE users (
  id         INTEGER PRIMARY KEY DEFAULT nextval('glob_seq'),
  first_name VARCHAR NOT NULL,
  last_name  VARCHAR NOT NULL,
  email      VARCHAR NOT NULL,
  username   VARCHAR NOT NULL,
  password   VARCHAR NOT NULL
);

CREATE UNIQUE INDEX users_unique_email_idx
  ON users (email);
CREATE UNIQUE INDEX users_unique_username_idx
  ON users (username);

-- Table "roles"
CREATE TABLE roles (
  id   INTEGER PRIMARY KEY DEFAULT nextval('glob_seq'),
  name VARCHAR(100) NOT NULL,
  UNIQUE (name)
);

-- Table "user_role" (for mapping user and role)
CREATE TABLE user_roles (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  CONSTRAINT user_roles_idx UNIQUE (user_id, role_id),

  FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  FOREIGN KEY (role_id) REFERENCES roles (id) ON DELETE CASCADE
);

-- Table "point"
CREATE TABLE points (
  id          INTEGER PRIMARY KEY DEFAULT nextval('glob_seq'),
  user_id     INTEGER   NOT NULL,
  latitude    FLOAT     NOT NULL,
  longitude   FLOAT     NOT NULL,
  date        TIMESTAMP NOT NULL,
  description VARCHAR,
  photo_link  VARCHAR,
  FOREIGN KEY (user_id) REFERENCES users (id)
);

-- Populate db

INSERT INTO users VALUES
  (1, 'The', 'Boss', 'michael.khoroshun@gmail.comn', 'admin',
   '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO roles VALUES (1, 'ROLE_USER');
INSERT INTO roles VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_roles VALUES (1, 2);