-- 회원가입 쿼리
CREATE OR REPLACE PROCEDURE up_insmember
(
   p회원아이디 member.회원_회원아이디%TYPE
   , p비밀번호 member.회원_비밀번호%TYPE
   , p휴대폰번호 member.회원_휴대폰번호%TYPE
   , p이메일 member.회원_이메일%TYPE
   , p생년월일 member.회원_생년월일%TYPE
   , p회원ID생성일 member.회원_ID생성일%TYPE := null
   , p보유관람권 member.회원_보유관람권%TYPE := null
   , p선호극장 member.회원_선호극장%TYPE := null
   , p선호장르 member.회원_선호장르%TYPE := null
   , p선호시간 member.회원_선호시간%TYPE := null
   , p무인발권기 member.회원_무인발권기%TYPE 
 )
IS
   
BEGIN
    INSERT INTO member ( 회원_회원아이디, 회원_비밀번호, 회원_휴대폰번호, 회원_이메일, 회원_생년월일, 회원_ID생성일, 회원_보유관람권, 회원_선호극장, 회원_선호장르, 회원_선호시간, 회원_무인발권기 )
    VALUES (p회원아이디, p비밀번호, p휴대폰번호, p이메일, p생년월일, TO_CHAR(SYSDATE, 'RR/MM/DD'), p보유관람권, p선호극장, p선호장르, p선호시간, p무인발권기);
     
COMMIT;    
-- EXCEPTION     
END;

EXEC up_insmember (p회원아이디 => 'sumin', p비밀번호 => 'angel1004', p휴대폰번호 => '010-1234-5678'
    , p이메일 => 'ksm7893@naver.com', p생년월일=> TO_DATE('1997-08-28', 'RR-MM-DD'), p무인발권기=>'Y');
    
    
    
    
EXEC up_insmember (p회원아이디 => 'kkk', p비밀번호 => '1234', p휴대폰번호 => '010-1234-5678', p이메일 => 'genie@naver.com', p생년월일=> TO_DATE('1999-09-02', 'RR-MM-DD'), p무인발권기=>'Y');
-- 아이디 중복 예외처리, 비밀번호 정규표현식 예외처리, 필수항목 입력안했을때 나오는 예외처리

select * from member

-- 회원탈퇴 쿼리
CREATE OR REPLACE PROCEDURE up_delmember
(
   p회원아이디 member.회원_회원아이디%TYPE
 )
IS   
BEGIN  

    DELETE FROM member
    WHERE 회원_회원아이디 = p회원아이디;
     
COMMIT;    
-- EXCEPTION     
END;