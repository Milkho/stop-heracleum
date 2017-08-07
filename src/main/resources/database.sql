-- Table "user"
CREATE TABLE IF NOT EXISTS user (
  id         INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(50)  NOT NULL,
  last_name  VARCHAR(50)  NOT NULL,
  email      VARCHAR(50)  NOT NULL,
  username   VARCHAR(30)  NOT NULL,
  password   VARCHAR(255) NOT NULL
)
  ENGINE = InnoDB;

-- Table "role"
CREATE TABLE IF NOT EXISTS role (
  id   INT          NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  UNIQUE (name)
)
  ENGINE = InnoDB;

-- Table "user_role" (for mapping user and role)
CREATE TABLE IF NOT EXISTS user_role (
  user_id INT NOT NULL,
  role_id INT NOT NULL,

  FOREIGN KEY (user_id) REFERENCES user (id),
  FOREIGN KEY (role_id) REFERENCES role (id),

  UNIQUE (user_id, role_id)
)
  ENGINE = InnoDB;

-- Table "point"
CREATE TABLE IF NOT EXISTS point (
  id         INT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id    INT    NOT NULL,
  latitude   DOUBLE NOT NULL,
  longitude  DOUBLE NOT NULL,
  date       DATE   NOT NULL,
  photo_link VARCHAR(255),
  FOREIGN KEY (user_id) REFERENCES user (id)
)
  ENGINE = InnoDB;

-- Populate db

INSERT INTO user VALUES (1, 'The', 'Boss', 'admin@stopheracleum.com', 'admin', '$2a$11$uSXS6rLJ91WjgOHhEGDx..VGs7MkKZV68Lv5r1uwFu7HgtRn3dcXG');

INSERT INTO role VALUES (1, 'ROLE_USER');
INSERT INTO role VALUES (2, 'ROLE_ADMIN');

INSERT INTO user_role VALUES (1, 2);
