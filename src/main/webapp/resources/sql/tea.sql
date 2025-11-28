desc tea;
-- 1. 영국 (UK)
INSERT INTO tea VALUES ('T1001', '로얄 잉글리쉬 브렉퍼스트', 35000, '아침을 깨우는 강렬한 바디감의 홍차입니다. 밀크티로 즐기기에 가장 이상적입니다.', 'UK', 'Black Tea', 'Gift Box', '100', 'T1001.jpg');
INSERT INTO tea VALUES ('T1002', '클래식 얼그레이 리필', 18000, '천연 베르가못 향이 가득한 베스트셀러 홍차입니다.', 'UK', 'Black Tea', 'Refill Pack', '200', 'T1002.jpg');

-- 2. 한국 (Korea)
INSERT INTO tea VALUES ('T2001', '제주 유기농 세작', 45000, '청정 제주의 봄햇살을 머금고 자란 어린 잎으로 만든 최고급 녹차입니다.', 'Korea', 'Green Tea', 'Canister', '50', 'T2001.jpg');
INSERT INTO tea VALUES ('T2002', '지리산 국화차', 29000, '가을의 정취를 담은 국화차입니다. 따뜻한 물에서 피어나는 꽃을 감상해보세요.', 'Korea', 'Flower Tea', 'Gift Box', '80', 'T2002.jpg');

-- 3. 중국 (China)
INSERT INTO tea VALUES ('T3001', '운남성 보이차 (숙차)', 55000, '오랜 시간 발효시켜 깊고 진한 향과 부드러운 목넘김이 특징입니다.', 'China', 'Puer Tea', 'Paper Wrap', '30', 'T3001.jpg');
INSERT INTO tea VALUES ('T3002', '황실 자스민 펄', 42000, '찻잎을 진주처럼 말아 자스민 향을 입힌 고급 화차입니다.', 'China', 'Jasmine', 'Tin Case', '60', 'T3002.jpg');

-- 4. 기타
INSERT INTO tea VALUES ('T4001', '캐모마일 허브티', 15000, '카페인이 없어 밤에도 부담 없는 허브티입니다.', 'Germany', 'Herb Tea', 'Box', '150', 'T4001.jpg');
ALTER TABLE tea MODIFY t_unitsInStock INT;