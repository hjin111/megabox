CREATE OR REPLACE PROCEDURE l_PAY_STATE
(
    p예매번호 TICKETING.예매_예매번호%TYPE
    
)
IS
    -- 커서 선언부
    CURSOR pcursor IS
    SELECT t.예매_예매번호, t.예매_성인, t.예매_청소년, t.예매_총가격, m.결제방법_수단선택 
    FROM PAY_STATE p JOIN TICKETING t ON p.예매_예매번호 = t.예매_예매번호
                        JOIN PAY_METHOD m ON p.결제방법_수단선택 = m.결제방법_수단선택
    WHERE t.예매_예매번호 = p예매번호; 
    

    -- 변수 선언부
    v예매번호 TICKETING.예매_예매번호%TYPE;
    v성인 TICKETING.예매_성인%TYPE;
    v청소년 TICKETING.예매_청소년%TYPE;
    v총가격 TICKETING.예매_총가격%TYPE;
    v수단선택 PAY_METHOD.결제방법_수단선택%TYPE;
    
BEGIN
    OPEN pcursor;
    LOOP
            FETCH pcursor INTO v예매번호, v성인, v청소년, v총가격, v수단선택 ;
    EXIT WHEN pcursor%NOTFOUND;

-- DBMS_OUTPUT.ENABLE(buffer_size => 100000);
DBMS_OUTPUT.PUT_LINE( ' 다음은 예매하신 내역입니다. ' || CHR(10) ||
                      '예매번호 = ' || v예매번호 || CHR(10)|| 
                      '선택하신 성인 수 = ' || v성인 || ', ' || '선택하신 청소년 수 = ' || v청소년 || ', ' || CHR(10)||
                      '선택하신 결제수단 = ' || v수단선택 || CHR(10)||
                      '할인 전 총 금액 = ' || v총가격 );
END LOOP;
-- 커서로부터 가져온 데이터가 없을 경우 오류 메시지 출력
IF pcursor%ROWCOUNT = 0
THEN
DBMS_OUTPUT.PUT_LINE('다음 예매번호에 대한 예매 및 결제 정보가 없습니다!');
END IF;
-- 커서 닫기
CLOSE pcursor;
END;
----------------------------------------------------------------------------------------------------------------------
EXEC l_PAY_STATE (123125);
----------------------------------------------------------------------------------------------------------------------

select * from price

select * from ticketing
