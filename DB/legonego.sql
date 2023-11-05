create database legonego;

use legonego;

create table board(
    bno INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    visit int DEFAULT 0,
    count int default 0
);