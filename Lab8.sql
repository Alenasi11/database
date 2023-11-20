DROP TABLE IF EXISTS task_assignees;
DROP TABLE IF EXISTS files;
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS projects;
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE projects (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE tasks (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    project_id INT,
    author_id INT,
    task_description TEXT,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE task_assignees (
    assignment_id INT PRIMARY KEY,
    task_id INT,
    assignee_id INT,
    FOREIGN KEY (task_id) REFERENCES tasks(id),
    FOREIGN KEY (assignee_id) REFERENCES users(id)
);

CREATE TABLE files (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    url VARCHAR(255),
    project_id INT NULL,
    task_id INT NULL,
    FOREIGN KEY (project_id) REFERENCES projects(id),
    FOREIGN KEY (task_id) REFERENCES tasks(id)
);

INSERT INTO users (id, name) VALUES
(1, 'Аліна'),
(2, 'Валерія'),
(3, 'Оксана');

INSERT INTO projects (id, name) VALUES
(1, 'Розробка веб-додатку'),
(2, 'Вивчення інформації щодо проекту'),
(3, 'Презинтація');

INSERT INTO tasks (id, name, project_id, author_id, task_description) VALUES
(1, 'Створення головної сторінки додатку', 1, 1, 'Створити макет в Figma та CSS та HTML-кодування'),
(2, 'Отримати нові знання для виконання роботи', 3, 2, 'Виконати вимоги та створити презинтацію'),
(3, 'Досліджуємо нові методи', 2, 3, 'Вивчаємо нові можливості');

INSERT INTO task_assignees (assignment_id, task_id, assignee_id) VALUES
(1, 1, 2), 
(2, 2, 3),
(3, 3, 1); 