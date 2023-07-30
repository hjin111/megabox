-- 영화 정보 조회 프로시저

CREATE OR REPLACE PROCEDURE movie_information 
(
    p영화 movie_infor.영화_영화번호%TYPE
)
IS
    -- 커서 선언부
    CURSOR vcursor IS
    SELECT m.영화_영화제목, m.영화_감독,m.영화_장르, m.영화_자막유, m.영화_누적관객수
    FROM movie_infor m
    WHERE m.영화_영화번호 = p영화;


    -- 변수 선언부
    
    v영화제목 movie_infor.영화_영화제목%TYPE;
    v영화감독 movie_infor.영화_감독%TYPE;
    v영화장르 movie_infor.영화_장르%TYPE;
    v영화자막유무 movie_infor.영화_자막유%TYPE;
    v영화누적관객수 movie_infor.영화_누적관객수%TYPE;

BEGIN
    -- 커서 열기
    OPEN vcursor;
    LOOP
        -- 커서로부터 데이터 읽기
        FETCH vcursor INTO v영화제목, v영화감독, v영화장르, v영화자막유무, v영화누적관객수;
        EXIT WHEN vcursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE( v영화제목 || ' ' || v영화감독 || ' ' || v영화장르 || ' ' || v영화자막유무 || ' ' || v영화누적관객수 );
    END LOOP;
    -- 커서로부터 가져온 데이터가 없을 경우 오류 메시지 출력
    IF vcursor%ROWCOUNT = 0
   THEN 
        DBMS_OUTPUT.PUT_LINE('오류');
    END IF;
    -- 커서 닫기
    CLOSE vcursor;
END; 

EXEC movie_information(11111111);

select * from movie_infor