-- 인원 수 카운팅

CREATE OR REPLACE TRIGGER trg_total_audience
AFTER INSERT ON ticketing
FOR EACH ROW
BEGIN
	UPDATE movie_infor
	SET 영화_누적관객수 = 영화_누적관객수 + :new.예매_성인 + :new.예매_청소년
	WHERE movie_infor.영화_영화번호 IN (
		SELECT screen_infor.영화_영화번호
		FROM screen_infor
		WHERE screen_infor.상정_상영정보번호 = :new.상정_상영정보번호
	);
END;
/

