-- 회원쿠폰목록 시퀀스 생성
CREATE SEQUENCE coupon_no
    INCREMENT BY 1 -- 1씩 증가
    START WITH 1  -- 1부터 증가
    MAXVALUE 100  
    NOCYCLE
    NOCACHE;   
    
--   

-- 쿠폰삭제/ 회쿠목 추가        
CREATE OR REPLACE PROCEDURE insert_coupon (
  p회원_회원아이디 member.회원_회원아이디%type,--
  p쿠폰_관람번호 coupon.쿠폰_관람번호%type--
) IS
  v_coupon_exists NUMBER;
  v_user_exists NUMBER;
BEGIN
  
  SELECT COUNT(*) INTO v_coupon_exists FROM Coupon WHERE 쿠폰_관람번호 = p쿠폰_관람번호;


  SELECT COUNT(*) INTO v_user_exists FROM member WHERE member.회원_회원아이디 = p회원_회원아이디; 
 
    IF v_coupon_exists = 1 AND  v_user_exists = 1 THEN
    INSERT INTO m_cp_list(회쿠목_번호,회원_회원아이디,회쿠목_내쿠폰번호)
    VALUES ( coupon_no.NEXTVAL, p회원_회원아이디, p쿠폰_관람번호);
    DELETE FROM Coupon WHERE coupon.쿠폰_관람번호 = p쿠폰_관람번호;
    UPDATE member SET 회원_보유관람권 = NVL(회원_보유관람권, 0) + 1 WHERE 회원_회원아이디 = p회원_회원아이디;
    DBMS_OUTPUT.PUT_LINE('쿠폰이 발행되었습니다.');
    ELSIF v_coupon_exists = 0 AND v_user_exists = 1 THEN 
    DBMS_OUTPUT.PUT_LINE('이미 발행 됐거나 없는 쿠폰입니다.');
    ELSif v_coupon_exists = 1 AND v_user_exists = 0 THEN 
    DBMS_OUTPUT.PUT_LINE('존재하지 않는 회원입니다.');
    ELSE
    DBMS_OUTPUT.PUT_LINE('다시 입력해주세요.');
  END IF;
END;

EXEC insert_coupon ('tkdqjazld','1001-2223-4567-9874');
EXEC insert_coupon ('kkk','1001-7894-6524-9631');

EXEC insert_coupon ('yejin','1001-22222223-4567-9874');

select * from m_cp_list

