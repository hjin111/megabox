-- 비회원 프로시져
CREATE OR REPLACE PROCEDURE in_NON_MEMBER
(
    p휴대폰번호 NON_MEMBER.비회원_휴대폰번호%TYPE
    ,p이름 NON_MEMBER.비회원_이름%TYPE
    ,p생년월일 NON_MEMBER.비회원_생년월일%TYPE
    ,P비밀번호 NON_MEMBER.비회원_비밀번호%TYPE
)
IS

BEGIN
    INSERT INTO NON_MEMBER(비회원_휴대폰번호,비회원_이름,비회원_생년월일,비회원_비밀번호) 
    VALUES(p휴대폰번호,p이름,p생년월일,P비밀번호);
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE( '휴대폰 번호 => ' || p휴대폰번호 || ',' || '이름 => ' || p이름 || ',' || '생년월일 => ' || p생년월일 || ',' || '비밀번호 => ' || p비밀번호 );
   
END;

-- 입력값
EXEC in_NON_MEMBER( '010-1234-5678' , '이예진', TO_DATE( '1997-09-02','RR/MM/DD') ,'genie');

-- 입력값 조회
SELECT *
FROM NON_MEMBER;

-- 삭제
DELETE FROM NON_MEMBER
WHERE 비회원_이름 = '진예림';