CREATE TABLE IF NOT EXISTS member (
    id VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL,
    name VARCHAR(30),
    gender VARCHAR(10),
    birth VARCHAR(20),
    mail VARCHAR(30),
    phone VARCHAR(20),
    address VARCHAR(100),
    regist_day VARCHAR(50),
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;
INSERT INTO member VALUES ('admin', '1234', '관리자', '여성', '2002-07-24', 'admin@tea.com', '010-3312-7915', '서울시', '2024-01-01');