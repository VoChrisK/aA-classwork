PRAGMA foreign_keys = ON;

CREATE TABLE users (
  user_id INTEGER NOT NULL PRIMARY KEY,
  fname  TEXT NOT NULL,
  lname  TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title  TEXT NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL, 
  FOREIGN KEY (author_id) REFERENCES question_follows(author_id)
);

CREATE TABLE question_follows (
  author_id INTEGER PRIMARY KEY,
  user_id INTEGER,

  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE replies(
  reply_id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  parent_id INTEGER,
  user_id INTEGER NOT NULL,
  body  TEXT NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(reply_id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE question_likes(
  id INTEGER PRIMARY KEY,
  user_id INTEGER,
  question_id INTEGER,
  like INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Chris', 'Vo'),
  ('Julius', 'Wu'),
  ('David', 'Chin'),
  ('Sarah', 'Jiang'),
  ('Julie', 'Adams'),
  ('Elson', 'Li');

INSERT INTO
  question_follows (author_id, user_id)
VALUES
  (1, 1),
  (2, 1),
  (3, 3);

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('How am I supposed work on this problem?', "some text", 1),
  ('Why am I asking this question?', "text text text", 1),
  ('Why do we need SQL?', "SQL blah blah blah", 3);

INSERT INTO
  replies (question_id, parent_id, user_id, body)
VALUES
  (1, NULL, 1, "some more text"),
  (1, 1, 1, "some more, more text");

INSERT INTO
  question_likes (user_id, question_id, like)
VALUES
  (1, 1, 2000);