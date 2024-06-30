create database legonego;

-- 윈도우 노트북 한글 인코딩 안될 때 사용
ALTER DATABASE legonego DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

use legonego;

SHOW TABLES;
-- ==========================================================
CREATE TABLE ROLE(
                     role_id INT PRIMARY KEY AUTO_INCREMENT,
                     role VARCHAR(255) DEFAULT NULL
);

SELECT * FROM ROLE;

INSERT INTO ROLE VALUES (DEFAULT, 'ADMIN');

-- ========================================= 안쓸듯 ===============================================
CREATE TABLE user(
                     user_id INT PRIMARY KEY AUTO_INCREMENT,
                     active INT DEFAULT 0,
                     login_id VARCHAR(255) NOT NULL,
                     user_name VARCHAR(255) NOT NULL,
                     password VARCHAR(300) NOT NULL
);

SELECT * FROM USER;

DROP TABLE USER;

-- ========================================= 안쓸듯 ===============================================

-- ==========================================================
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

UPDATE euser SET PASSWORD='$2a$10$3WCl8X4BUzOItXcQBWov3OqmoSCdX9Z1yy6fsM7wt/xIn515RpHa6';  -- 암호화 공통으로 박아 넣기

COMMIT;

SELECT * FROM euser;

-- ==========================================================

CREATE TABLE user_role(
                          user_id INT NOT NULL,
                          role_id INT NOT NULL,
                          PRIMARY KEY (user_id, role_id)
);

INSERT INTO user_role VALUES ( 1, 1);

SELECT * FROM user_role;

-- ==========================================================

CREATE TABLE notice(
                       no INT PRIMARY KEY AUTO_INCREMENT,
                       title VARCHAR(300) NOT NULL,
                       content VARCHAR(1000) NOT NULL,
                       author INT,
                       regdate DATETIME DEFAULT CURRENT_TIME,
                       cnt INT DEFAULT 0,
                       FOREIGN KEY(author) REFERENCES euser(id) ON DELETE CASCADE
);

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

COMMIT;

-- ==========================================================

CREATE TABLE faq (
                     fno INT PRIMARY KEY AUTO_INCREMENT,
                     question VARCHAR(1000) NOT NULL,
                     answer VARCHAR(1000) NOT NULL,
                     cnt INT DEFAULT 0 NOT NULL
);


INSERT INTO faq VALUES (DEFAULT,'테1','테1 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테2','테2 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테3','테3 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테4','테4 내용', DEFAULT);
INSERT INTO faq VALUES (DEFAULT,'테5','테5 내용', DEFAULT);

SELECT * FROM faq;

COMMIT;


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
SELECT *  FROM fileobj;
COMMIT;

CREATE TABLE fileboard (
                           postno int NOT NULL AUTO_INCREMENT PRIMARY KEY,	-- 글 번호
                           title VARCHAR(100) not null,   -- 글제목
                           content VARCHAR(1500) not null,    -- 글내용
                           regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),   -- 작성일
                           visited INT DEFAULT 0   -- 조회수
);

DESC fileboard;
SELECT *  FROM FILEobj;
COMMIT;

-- ==========================================================

-- 댓글 처리
CREATE TABLE COMMENT(
                        cno INT PRIMARY KEY AUTO_INCREMENT, -- 댓글 번호
                        author VARCHAR(20) NOT NULL, -- 댓글 작성자
                        content VARCHAR(500) NOT NULL, -- 댓글 내용
                        regdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP, -- 댓글 등록일
                        par INT(10) NOT NULL -- 해당 후기 번호
);



DESC comment;
SELECT * FROM comment;
COMMIT;

-- ==========================================================

-- 상품 구매 후기
CREATE table review(
                       no INT AUTO_INCREMENT PRIMARY KEY,
                       title VARCHAR(200) NOT NULL,
                       content VARCHAR(2000) NOT NULL,
                       resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                       visit int DEFAULT 0,
                       id VARCHAR(50)
);

DESC review;
SELECT * FROM review;
COMMIT;