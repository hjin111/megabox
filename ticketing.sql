-- 영화 예매 쿼리

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
    SELECT NVL2(MAX( 예매_예매번호 ), MAX(예매_예매번호), 0)+1 INTO v예매번호
    FROM ticketing;
    
    SELECT i.상정_2D_3D, i.상정_조조여부 INTO v화면, v조조
    FROM screen_infor i
    WHERE i.상정_상영정보번호 = p상영정보번호;
    
    INSERT INTO ticketing ( 예매_예매번호, 예매_성인, 예매_청소년, 예매_예매날짜, 예매_총가격, 회원_회원아이디, 비회원_휴대폰번호, 상정_상영정보번호 ) 
    VALUES( v예매번호, p성인, p청소년, TO_DATE(p예매날짜, 'YY/MM/DD'), 0, p회원조회, p비회원조회, p상영정보번호 );
    
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

                
EXEC up_ticketing ( p성인 => 5, p청소년 => 2, p예매날짜 => TO_DATE('2023-4-8', 'RR-MM-DD'), p회원조회 => 'yejin', p비회원조회 => '010-2222-1111', p상영정보번호 => 1115);                

