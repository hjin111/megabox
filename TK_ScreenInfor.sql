-------------------------------------------------------------------------------------------------------------------------------------
-- 상영정보번호 입력으로 영화, 극장, 상영관, 좌석의 정보 다 불러오는 프로시져
-------------------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE l_SCREEN_INFOR
(
    p상영정보번호 SCREEN_INFOR.상정_상영정보번호%TYPE
    
)
IS
    -- 커서 선언부
    CURSOR icursor IS
    SELECT i.상정_상영정보번호, i.상정_시작기간, i.상정_종료기간, i.상정_상영시간, i.상정_종영시간, i.상정_2D_3D, i.상정_조조여부, 
           i.상정_상영날짜, i.상정_자막유무, i.상정_더빙유무, c.극장_지역, c.극장_지점, s.상영관_상영관,
           m.영화_영화제목, m.영화_장르, m.영화_감독, m.영화_개봉일, m.영화_자막유, m.영화_설명 ,m.영화_누적관객수,
           m.영화_출연진, se.좌석_좌석명, se.예매_여부
    FROM screen_infor i JOIN movie_infor m ON i.영화_영화번호 = m.영화_영화번호
                        JOIN screen s ON i.상영관_상영관 = s.상영관_상영관
                        JOIN cinema c ON s.극장_극장번호 = c.극장_극장번호
                        JOIN seat se ON s.상영관_상영관 = se.상영관_상영관
    WHERE i.상정_상영정보번호 = p상영정보번호; 
    

    -- 변수 선언부
    v상영정보번호 screen_infor.상정_상영정보번호%TYPE;
    v시작기간 screen_infor.상정_시작기간%TYPE;
    v종료기간 screen_infor.상정_종료기간%TYPE;
    v상영시간 screen_infor.상정_상영시간%TYPE;
    v종영시간 screen_infor.상정_종영시간%TYPE;
    v2D_3D screen_infor.상정_2D_3D%TYPE;
    v조조여부 screen_infor.상정_조조여부%TYPE;
    v상영날짜 screen_infor.상정_상영날짜%TYPE;
    v자막유무 screen_infor.상정_자막유무%TYPE;
    v더빙유무 screen_infor.상정_더빙유무%TYPE;
    v상영관 screen.상영관_상영관%TYPE;
    v지역 cinema.극장_지역%TYPE;
    v지점 cinema.극장_지점%TYPE;
    v영화제목 movie_infor.영화_영화제목%TYPE;
    v장르 movie_infor.영화_장르%TYPE;
    v감독 movie_infor.영화_감독%TYPE;
    v개봉일 movie_infor.영화_개봉일%TYPE;
    v자막유 movie_infor.영화_자막유%TYPE;
    v설명 movie_infor.영화_설명%TYPE;
    v누적관객수 movie_infor.영화_누적관객수%TYPE;
    v출연진 movie_infor.영화_출연진%TYPE;
    v좌석명 seat.좌석_좌석명%TYPE;
    v예매여부 seat.예매_여부%TYPE;
    seat_status_msg VARCHAR2(100);
    
BEGIN
    OPEN icursor;
    LOOP
            FETCH icursor INTO v상영정보번호, v시작기간, v종료기간, v상영시간, v종영시간, v2D_3D, v조조여부, 
                v상영날짜, v자막유무, v더빙유무, v지역, v지점, v상영관, v영화제목, v장르, v감독, v개봉일,
                v자막유, v설명, v누적관객수, v출연진, v좌석명, v예매여부;
        EXIT WHEN icursor%NOTFOUND;
        
IF v예매여부 = 'Y' THEN
seat_status_msg := '예매되어진 좌석입니다.';
ELSE
seat_status_msg := '예매 가능한 좌석입니다.';
END IF;

DBMS_OUTPUT.ENABLE(buffer_size => 100000);
DBMS_OUTPUT.PUT_LINE( ' 선택하신 극장 및 상영관 정보입니다. ' ||'극장지역 = ' || v지역 || ', ' || '극장지점 = ' || v지점 || ', ' || '상영관 = ' || v상영관 || ', ' || '좌석명 = ' || v좌석명
||', ' || '예매여부 = ' || v예매여부 || CHR(10) || '선택하신 영화 정보입니다. ' ||'영화제목 = ' || v영화제목 || ', ' || '영화장르 = ' || v장르
|| ', ' || '영화감독 = ' || v감독 || ', ' || '영화 개봉일 = ' || v개봉일 || ', ' || '영화자막 유무 = ' || v자막유 ||
', ' || '영화설명 = ' || v설명 || ', ' || '영화 누적관객수 = ' || v누적관객수 || ', ' || '영화 출연진 = ' || v출연진 || CHR(10)
||'상영기간(시작) = ' || v시작기간 || ', ' || '상영기간(종료) = ' || v종료기간 || ', ' || '상영시간(시작) = ' || v상영시간 || ', ' || '상영시간(종료) = ' ||
v종영시간|| ', ' || '상영 타입 = ' || v2D_3D || ', ' || '조조 여부 = ' || v조조여부 || ', ' || '상영날짜 = ' || v상영날짜
|| ', ' || '자막 유무 = ' || v자막유무 || ', ' || '더빙유무 = ' || v더빙유무
);
DBMS_OUTPUT.NEW_LINE;
END LOOP;
-- 커서로부터 가져온 데이터가 없을 경우 오류 메시지 출력
IF icursor%ROWCOUNT = 0
THEN
DBMS_OUTPUT.PUT_LINE('선택하신 극장 및 상영관, 영화, 상영 정보가 없습니다!');
END IF;
-- 커서 닫기
CLOSE icursor;
END;
------------------------------------------------------------------------------------------------------------------------
-- 예매 인설트 부분 및 상영정보 dbms 출력창에 나타내기 
------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE up_ticketing
(
    p성인 ticketing.예매_성인%TYPE := 0
    , p청소년 ticketing.예매_청소년%TYPE := 0
    , p예매날짜 ticketing.예매_예매날짜%TYPE
    , p회원조회 member.회원_회원아이디%TYPE := null
    , p비회원조회 non_member.비회원_휴대폰번호%TYPE := null
    , p상영정보번호 screen_infor.상정_상영정보번호%TYPE 
)

IS
    v상영정보 screen_infor.상정_상영정보번호%TYPE := p상영정보번호;
    v화면 screen_infor.상정_2D_3D%TYPE;
    v조조 screen_infor.상정_조조여부%TYPE;
    v예매번호 ticketing.예매_예매번호%TYPE;
    
BEGIN
    
    DECLARE
    BEGIN
       l_SCREEN_INFOR(p상영정보번호);
    END; 
    
    SELECT NVL2(MAX( 예매_예매번호 ), MAX( 예매_예매번호 ), 0)+1 INTO v예매번호
    FROM ticketing;
    
    SELECT i.상정_2D_3D, i.상정_조조여부 INTO v화면, v조조
    FROM screen_infor i
    WHERE i.상정_상영정보번호 = p상영정보번호;
    
    INSERT INTO ticketing ( 예매_예매번호, 예매_성인, 예매_청소년, 예매_예매날짜, 예매_총가격, 회원_회원아이디, 비회원_휴대폰번호, 상정_상영정보번호 ) 
    VALUES( v예매번호, p성인, p청소년, TO_DATE( p예매날짜, 'YY/MM/DD' ), 0, p회원조회, p비회원조회, p상영정보번호 );
    
    IF v조조 = '조조' and v화면 = '2D' THEN
        UPDATE ticketing
        SET 예매_총가격 = ( SELECT  p성인 * 10000 + p청소년 * 8000 FROM ticketing WHERE 예매_예매번호 = v예매번호 )
        WHERE 예매_예매번호 = v예매번호 and p상영정보번호 = v상영정보;
    ELSIF v조조 = '조조' and v화면 = '3D' THEN
        UPDATE ticketing
        SET 예매_총가격 = ( SELECT  p성인 * 12000 + p청소년 * 10000 FROM ticketing WHERE 예매_예매번호 = v예매번호 )
        WHERE 예매_예매번호 = v예매번호 and p상영정보번호 = v상영정보;
     ELSIF v조조 = '일반' and v화면 = '2D' THEN
        UPDATE ticketing
        SET 예매_총가격 = ( SELECT  p성인 * 15000 + p청소년 * 10000 FROM ticketing WHERE 예매_예매번호 = v예매번호 )
        WHERE 예매_예매번호 = v예매번호 and p상영정보번호 = v상영정보;
    ELSIF v조조 = '일반' and v화면 = '3D' THEN
        UPDATE ticketing
        SET 예매_총가격 = ( SELECT  p성인 * 16000 + p청소년 * 10000 FROM ticketing WHERE 예매_예매번호 = v예매번호 )
        WHERE 예매_예매번호 = v예매번호 and p상영정보번호 = v상영정보;
    END IF; 
    COMMIT;
END;    
----------------------------------------------------------------------------------------------------------------------
EXEC up_ticketing ( 1, 1, '2023-4-8', p회원조회 => 'dPfla21', p상영정보번호 => 1115);
----------------------------------------------------------------------------------------------------------------------
