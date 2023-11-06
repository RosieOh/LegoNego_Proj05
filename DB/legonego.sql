create database legonego;

-- 윈도우 노트북 한글 인코딩 안될 때 사용
ALTER DATABASE legonego DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use legonego;

-- ==========================================================
CREATE TABLE ROLE(
                     role_id INT PRIMARY KEY AUTO_INCREMENT,
                     role VARCHAR(255) DEFAULT NULL
);

SELECT * FROM ROLE;

INSERT INTO ROLE VALUES (DEFAULT, 'ADMIN');

CREATE TABLE user(
                     user_id INT PRIMARY KEY AUTO_INCREMENT,
                     active INT DEFAULT 0,
                     login_id VARCHAR(255) NOT NULL,
                     user_name VARCHAR(255) NOT NULL,
                     password VARCHAR(300) NOT NULL
);

SELECT * FROM user;

CREATE TABLE euser (
                       id INT PRIMARY KEY AUTO_INCREMENT,
                       name VARCHAR(20) NOT NULL,
                       password VARCHAR(300) NOT NULL,
                       username VARCHAR(50) NOT NULL,
                       email VARCHAR(100) NOT NULL,
                       address VARCHAR(300),
                       tel VARCHAR(20),
                       regdate DATETIME DEFAULT CURRENT_TIMESTAMP,
                       lev VARCHAR(20) DEFAULT 'USER',
                       act VARCHAR(20) DEFAULT 'JOIN',
                       pt INT DEFAULT 0, -- 포인트
                       CONSTRAINT unique_name UNIQUE (name), -- 동명이인 방지
                       CONSTRAINT unique_id UNIQUE (id), -- id 중복 방지
                       CONSTRAINT unique_email UNIQUE (email) -- 이메일 중복 방지
);

-- 회원 테이블 더미 데이터
insert into euser values(DEFAULT, 'admin', '1234', '관리자', 'admin@legonego.com', '서울 구로구', '010-1234-5678', DEFAULT, 'ADMIN', default, DEFAULT);
insert into euser values(DEFAULT, 'sirious920', '1234', '오레오', 'sirious920@naver.com', '서울 관악구', '010-1234-5678', DEFAULT, 'ADMIN', default, DEFAULT);
insert into euser values(DEFAULT, 'test1', '1234', '테스트1', 'test1@edu.com', '서울 관악구', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);
insert into euser values(DEFAULT, 'test2', '1234', '테스트2', 'test2@edu.com', '서울 관악구', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);
insert into euser values(DEFAULT, 'test3', '1234', '테스트3', 'test3@edu.com', '서울 관악구', '010-1234-5678', DEFAULT, 'USER', default, DEFAULT);

UPDATE euser SET PASSWORD='$2a$10$3WCl8X4BUzOItXcQBWov3OqmoSCdX9Z1yy6fsM7wt/xIn515RpHa6';

COMMIT;

SELECT * FROM euser;

CREATE TABLE user_role(
                          user_id INT NOT NULL,
                          role_id INT NOT NULL,
                          PRIMARY KEY (user_id, role_id)
);

SELECT * FROM user_role;

INSERT INTO user_role VALUES ( 1, 1);


CREATE TABLE notice(
                       no INT PRIMARY KEY AUTO_INCREMENT,
                       title VARCHAR(300) NOT NULL,
                       content VARCHAR(1000) NOT NULL,
                       author INT,
                       regdate DATETIME DEFAULT CURRENT_TIME,
                       cnt INT DEFAULT 0,
                       FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

drop table notice;

INSERT INTO notice VALUES (DEFAULT,'테1','테1 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테2','테2 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테3','테3 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테4','테4 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테5','테5 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테6','테6 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테7','테7 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테8','테8 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테9','테9 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테10','테10 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테11','테11 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테12','테12 내용',1,DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'테13','테13 내용',1,DEFAULT, DEFAULT);


SELECT * FROM notice;