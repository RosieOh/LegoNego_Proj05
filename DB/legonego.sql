create database legonego;

-- 윈도우 노트북 한글 인코딩 안될 때 사용
ALTER DATABASE legonego DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use legonego;

-- ==========================================================

CREATE TABLE role(
                     role_id INT PRIMARY KEY AUTO_INCREMENT,
                     role VARCHAR(255) DEFAULT NULL)
;

DESC ROLE;

select * from legonego;

-- ==========================================================

CREATE TABLE user(
                     user_id INT PRIMARY KEY AUTO_INCREMENT,
                     active INT DEFAULT 0,
                     login_id VARCHAR(255) NOT NULL,
                     user_name VARCHAR(255) NOT NULL,
                     password VARCHAR(300) NOT NULL
);

DESC USER;

select * from USER;

-- ==========================================================

CREATE TABLE user_role(
                          user_id INT NOT NULL,
                          role_id INT NOT NULL,
                          PRIMARY KEY (user_id, role_id)
);

DESC user_role;

select * from user_role;

-- ==========================================================

create table board(
    bno INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    visit int DEFAULT 0,
    count int default 0
);

DESC board;

select * from board;

-- ==========================================================

CREATE TABLE faq (
                     fno INT AUTO_INCREMENT PRIMARY KEY,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);

DESC faq;

select * from faq;

-- ==========================================================

CREATE TABLE COMMENT(
                        dno INT PRIMARY KEY AUTO_INCREMENT, -- 댓글 번호
                        author VARCHAR(20) NOT NULL, -- 댓글 작성자
                        content VARCHAR(500) NOT NULL, -- 댓글 내용
                        regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 댓글 등록일
                        par INT(10) NOT NULL -- 해당 후기 번호
);

DESC comment;

select * from comment;

-- ==========================================================

CREATE TABLE fileobj (
                         no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         postno INT NOT NULL,
                         savefolder VARCHAR(400),
                         originfile VARCHAR(400),
                         savefile VARCHAR(800),
                         filesize LONG,
                         uploaddate VARCHAR(100)
);

DESC fileobj;

select * from fileobj;

-- ==========================================================

CREATE TABLE fileboard (
                           postno int NOT NULL AUTO_INCREMENT PRIMARY KEY,	-- 글 번호
                           title VARCHAR(100) not null,   -- 글제목
                           content VARCHAR(1500) not null,    -- 글내용
                           regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
                           visited INT DEFAULT 0   -- 조회수
);

DESC fileboard;

select * from fileboard;