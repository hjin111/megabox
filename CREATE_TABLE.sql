/* 영화 */
CREATE TABLE movie_infor (
	영화_영화번호 VARCHAR2(30) NOT NULL, /* 영화번호 */
	영화_장르 VARCHAR2(30) NOT NULL, /* 장르 */
	영화_감독 VARCHAR2(30) NOT NULL, /* 감독 */
	영화_영화제목 VARCHAR2(100) NOT NULL, /* 영화제목 */
	영화_개봉일 DATE NOT NULL, /* 개봉일 */
	영화_자막유 VARCHAR2(50) NOT NULL, /* 자막유무 */
	영화_설명 CLOB NOT NULL, /* 설명 */
	영화_누적관객수 NUMBER NOT NULL, /* 누적관객수 */
	영화_출연진 CLOB NOT NULL /* 출연진  */
);

COMMENT ON TABLE movie_infor IS '영화';

COMMENT ON COLUMN movie_infor.영화_영화번호 IS '영화번호';

COMMENT ON COLUMN movie_infor.영화_장르 IS '장르';

COMMENT ON COLUMN movie_infor.영화_감독 IS '감독';

COMMENT ON COLUMN movie_infor.영화_영화제목 IS '영화제목';

COMMENT ON COLUMN movie_infor.영화_개봉일 IS '개봉일';

COMMENT ON COLUMN movie_infor.영화_자막유 IS '자막유무';

COMMENT ON COLUMN movie_infor.영화_설명 IS '설명';

COMMENT ON COLUMN movie_infor.영화_누적관객수 IS '누적관객수';

COMMENT ON COLUMN movie_infor.영화_출연진 IS '출연진 ';

CREATE UNIQUE INDEX PK_movie_infor
	ON movie_infor (
		영화_영화번호 ASC
	);

ALTER TABLE movie_infor
	ADD
		CONSTRAINT PK_movie_infor
		PRIMARY KEY (
			영화_영화번호
		);

/* 극장 */
CREATE TABLE cinema (
	극장_극장번호 VARCHAR2(30) NOT NULL, /* 극장번호 */
	극장_지역 VARCHAR2(30) NOT NULL, /* 지역 */
	극장_지점 VARCHAR2(30) NOT NULL /* 지점 */
);

COMMENT ON TABLE cinema IS '극장';

COMMENT ON COLUMN cinema.극장_극장번호 IS '극장번호';

COMMENT ON COLUMN cinema.극장_지역 IS '지역';

COMMENT ON COLUMN cinema.극장_지점 IS '지점';

CREATE UNIQUE INDEX PK_cinema
	ON cinema (
		극장_극장번호 ASC
	);

ALTER TABLE cinema
	ADD
		CONSTRAINT PK_cinema
		PRIMARY KEY (
			극장_극장번호
		);

/* 상영관 */
CREATE TABLE screen (
	상영관_상영관 VARCHAR2(30) NOT NULL, /* 상영관 */
	극장_극장번호 VARCHAR2(30) NOT NULL /* 극장번호 */
);

COMMENT ON TABLE screen IS '상영관';

COMMENT ON COLUMN screen.상영관_상영관 IS '상영관';

COMMENT ON COLUMN screen.극장_극장번호 IS '극장번호';

CREATE UNIQUE INDEX PK_screen
	ON screen (
		상영관_상영관 ASC
	);

ALTER TABLE screen
	ADD
		CONSTRAINT PK_screen
		PRIMARY KEY (
			상영관_상영관
		);

/* 좌석 */
CREATE TABLE seat (
	좌석_좌석PK NUMBER NOT NULL, /* 좌석PK */
	좌석_좌석명 VARCHAR2(30) NOT NULL, /* 좌석명 */
	상영관_상영관 VARCHAR2(30) NOT NULL, /* 상영관 */
	예매_여부 VARCHAR2(30) /* 예매여부 */
);

COMMENT ON TABLE seat IS '좌석';

COMMENT ON COLUMN seat.좌석_좌석PK IS '좌석PK';

COMMENT ON COLUMN seat.좌석_좌석명 IS '좌석명';

COMMENT ON COLUMN seat.상영관_상영관 IS '상영관';

COMMENT ON COLUMN seat.예매_여부 IS '예매여부';

CREATE UNIQUE INDEX PK_seat
	ON seat (
		좌석_좌석PK ASC
	);

ALTER TABLE seat
	ADD
		CONSTRAINT PK_seat
		PRIMARY KEY (
			좌석_좌석PK
		);

/* 상영정보 */
CREATE TABLE screen_infor (
	상정_상영정보번호 NUMBER NOT NULL, /* 상영정보번호 */
	상정_시작기간 DATE NOT NULL, /* 상영기간(시작) */
	상정_종료기간 DATE, /* 상영기간(종료) */
	상정_상영시간 VARCHAR2(20), /* 상영시간(시간) */
	상정_종영시간 VARCHAR2(20), /* 상영시간(종료) */
	상정_2D_3D VARCHAR2(30), /* 상영타입(2D,3D) */
	상정_조조여부 VARCHAR2(30), /* 조조여부 */
	상정_상영날짜 DATE, /* 상영날짜 */
	상정_자막유무 VARCHAR(10), /* 자막유무 */
	상정_더빙유무 VARCHAR(10), /* 더빙유무 */
	상영관_상영관 VARCHAR2(30), /* 상영관 */
	영화_영화번호 VARCHAR2(30) /* 영화번호 */
);

COMMENT ON TABLE screen_infor IS '상영정보';

COMMENT ON COLUMN screen_infor.상정_상영정보번호 IS '상영정보번호';

COMMENT ON COLUMN screen_infor.상정_시작기간 IS '상영기간(시작)';

COMMENT ON COLUMN screen_infor.상정_종료기간 IS '상영기간(종료)';

COMMENT ON COLUMN screen_infor.상정_상영시간 IS '상영시간(시간)';

COMMENT ON COLUMN screen_infor.상정_종영시간 IS '상영시간(종료)';

COMMENT ON COLUMN screen_infor.상정_2D_3D IS '상영타입(2D,3D)';

COMMENT ON COLUMN screen_infor.상정_조조여부 IS '조조여부';

COMMENT ON COLUMN screen_infor.상정_상영날짜 IS '상영날짜';

COMMENT ON COLUMN screen_infor.상정_자막유무 IS '자막유무';

COMMENT ON COLUMN screen_infor.상정_더빙유무 IS '더빙유무';

COMMENT ON COLUMN screen_infor.상영관_상영관 IS '상영관';

COMMENT ON COLUMN screen_infor.영화_영화번호 IS '영화번호';

CREATE UNIQUE INDEX PK_screen_infor
	ON screen_infor (
		상정_상영정보번호 ASC
	);

ALTER TABLE screen_infor
	ADD
		CONSTRAINT PK_screen_infor
		PRIMARY KEY (
			상정_상영정보번호
		);

/* 결제방법 */
CREATE TABLE pay_method (
	결제방법_수단선택 VARCHAR2(30) NOT NULL, /* 결제수단선택 */
	결제방법_결제방법 VARCHAR2(30) /* 결제방법 */
);

COMMENT ON TABLE pay_method IS '결제방법';

COMMENT ON COLUMN pay_method.결제방법_수단선택 IS '결제수단선택';

COMMENT ON COLUMN pay_method.결제방법_결제방법 IS '결제방법';

CREATE UNIQUE INDEX PK_pay_method
	ON pay_method (
		결제방법_수단선택 ASC
	);

ALTER TABLE pay_method
	ADD
		CONSTRAINT PK_pay_method
		PRIMARY KEY (
			결제방법_수단선택
		);

/* 결제상태 */
CREATE TABLE pay_state (
	예매_예매번호 NUMBER NOT NULL, /* 예매번호 */
	결제상태_할인금액 NUMBER, /* 할인적용금액 */
	결제상태_최종금액 NUMBER, /* 최종결제금액 */
	결제방법_수단선택 VARCHAR2(30) NOT NULL /* 결제수단선택 */
);

COMMENT ON TABLE pay_state IS '결제상태';

COMMENT ON COLUMN pay_state.예매_예매번호 IS '예매번호';

COMMENT ON COLUMN pay_state.결제상태_할인금액 IS '할인적용금액';

COMMENT ON COLUMN pay_state.결제상태_최종금액 IS '최종결제금액';

COMMENT ON COLUMN pay_state.결제방법_수단선택 IS '결제수단선택';

CREATE UNIQUE INDEX PK_pay_state
	ON pay_state (
		예매_예매번호 ASC
	);

ALTER TABLE pay_state
	ADD
		CONSTRAINT PK_pay_state
		PRIMARY KEY (
			예매_예매번호
		);

/* 비회원 */
CREATE TABLE non_member (
	비회원_휴대폰번호 VARCHAR2(30) NOT NULL, /* 휴대폰번호 */
	비회원_이름 NVARCHAR2(30) NOT NULL, /* 이름 */
	비회원_생년월일 DATE NOT NULL, /* 생년월일 */
	비회원_비밀번호 VARCHAR2(30) NOT NULL /* 비밀번호 */
);

COMMENT ON TABLE non_member IS '비회원';

COMMENT ON COLUMN non_member.비회원_휴대폰번호 IS '휴대폰번호';

COMMENT ON COLUMN non_member.비회원_이름 IS '이름';

COMMENT ON COLUMN non_member.비회원_생년월일 IS '생년월일';

COMMENT ON COLUMN non_member.비회원_비밀번호 IS '비밀번호';

CREATE UNIQUE INDEX PK_non_member
	ON non_member (
		비회원_휴대폰번호 ASC
	);

ALTER TABLE non_member
	ADD
		CONSTRAINT PK_non_member
		PRIMARY KEY (
			비회원_휴대폰번호
		);

/* 연령구분 */
CREATE TABLE price_age (
	영화구분_연령 VARCHAR2(30) NOT NULL, /* 연령 */
	영화구분_연령구분 VARCHAR2(30) NOT NULL /* 연령구분 */
);

COMMENT ON TABLE price_age IS '연령구분';

COMMENT ON COLUMN price_age.영화구분_연령 IS '연령';

COMMENT ON COLUMN price_age.영화구분_연령구분 IS '연령구분';

CREATE UNIQUE INDEX PK_price_age
	ON price_age (
		영화구분_연령 ASC
	);

ALTER TABLE price_age
	ADD
		CONSTRAINT PK_price_age
		PRIMARY KEY (
			영화구분_연령
		);

/* 가격 */
CREATE TABLE price (
	가격_가격번호 VARCHAR2(30) NOT NULL, /* 가격번호 */
	조조여부_조조 VARCHAR2(30) NOT NULL, /* 조조 */
	화면스타일_화면 VARCHAR2(30) NOT NULL, /* 화면 */
	영화구분_연령 VARCHAR2(30) NOT NULL, /* 연령 */
	가격_금액 NUMBER NOT NULL /* 금액 */
);

COMMENT ON TABLE price IS '가격';

COMMENT ON COLUMN price.가격_가격번호 IS '가격번호';

COMMENT ON COLUMN price.조조여부_조조 IS '조조';

COMMENT ON COLUMN price.화면스타일_화면 IS '화면';

COMMENT ON COLUMN price.영화구분_연령 IS '연령';

COMMENT ON COLUMN price.가격_금액 IS '금액';

CREATE UNIQUE INDEX PK_price
	ON price (
		가격_가격번호 ASC
	);

ALTER TABLE price
	ADD
		CONSTRAINT PK_price
		PRIMARY KEY (
			가격_가격번호
		);

/* 화면스타일 */
CREATE TABLE price_style (
	화면스타일_화면 VARCHAR2(30) NOT NULL, /* 화면 */
	화면스타일_화면구분 VARCHAR2(30) NOT NULL /* 화면구분 */
);

COMMENT ON TABLE price_style IS '화면스타일';

COMMENT ON COLUMN price_style.화면스타일_화면 IS '화면';

COMMENT ON COLUMN price_style.화면스타일_화면구분 IS '화면구분';

CREATE UNIQUE INDEX PK_price_style
	ON price_style (
		화면스타일_화면 ASC
	);


ALTER TABLE price_style
	ADD
		CONSTRAINT PK_price_style
		PRIMARY KEY (
			화면스타일_화면
		);

/* 회원 */
CREATE TABLE member (
	회원_회원아이디 VARCHAR2(100) NOT NULL, /* 회원아이디 */
	회원_비밀번호 VARCHAR2(20) NOT NULL, /* 비밀번호 */
	회원_휴대폰번호 VARCHAR2(20) NOT NULL, /* 휴대폰번호 */
	회원_이메일 VARCHAR2(30) NOT NULL, /* 이메일 */
	회원_생년월일 DATE NOT NULL, /* 생년월일 */
	회원_ID생성일 DATE NOT NULL, /* ID생성일 */
	회원_보유관람권 NUMBER, /* 보유관람권 */
	회원_선호극장 VARCHAR2(30), /* 선호극장 */
	회원_선호장르 VARCHAR2(30), /* 선호장르 */
	회원_선호시간 NUMBER, /* 선호시간 */
	회원_무인발권기 VARCHAR2(30) NOT NULL /* 무인발권기 사용여부 */
);

COMMENT ON TABLE member IS '회원';

COMMENT ON COLUMN member.회원_회원아이디 IS '회원아이디';

COMMENT ON COLUMN member.회원_비밀번호 IS '비밀번호';

COMMENT ON COLUMN member.회원_휴대폰번호 IS '휴대폰번호';

COMMENT ON COLUMN member.회원_이메일 IS '이메일';

COMMENT ON COLUMN member.회원_생년월일 IS '생년월일';

COMMENT ON COLUMN member.회원_ID생성일 IS 'ID생성일';

COMMENT ON COLUMN member.회원_보유관람권 IS '보유관람권';

COMMENT ON COLUMN member.회원_선호극장 IS '선호극장';

COMMENT ON COLUMN member.회원_선호장르 IS '선호장르';

COMMENT ON COLUMN member.회원_선호시간 IS '선호시간';

COMMENT ON COLUMN member.회원_무인발권기 IS '무인발권기 사용여부';

CREATE UNIQUE INDEX PK_member
	ON member (
		회원_회원아이디 ASC
	);

ALTER TABLE member
	ADD
		CONSTRAINT PK_member
		PRIMARY KEY (
			회원_회원아이디
		);

/* 조조여부 */
CREATE TABLE price_jojo (
	조조여부_조조 VARCHAR2(30) NOT NULL, /* 조조 */
	조조여부_조조구분 VARCHAR2(30) NOT NULL /* 조조구분 */
);

COMMENT ON TABLE price_jojo IS '조조여부';

COMMENT ON COLUMN price_jojo.조조여부_조조 IS '조조';

COMMENT ON COLUMN price_jojo.조조여부_조조구분 IS '조조구분';

CREATE UNIQUE INDEX PK_price_jojo
	ON price_jojo (
		조조여부_조조 ASC
	);

ALTER TABLE price_jojo
	ADD
		CONSTRAINT PK_price_jojo
		PRIMARY KEY (
			조조여부_조조
		);

/* 예매 */
CREATE TABLE ticketing (
	예매_예매번호 NUMBER NOT NULL, /* 예매번호 */
	예매_성인 NUMBER NOT NULL, /* 성인 */
	예매_청소년 NUMBER NOT NULL, /* 청소년 */
	예매_예매날짜 DATE NOT NULL, /* 예매날짜 */
	예매_총가격 NUMBER NOT NULL, /* 총가격 */
	회원_회원아이디 VARCHAR2(100) NOT NULL, /* 회원아이디 */
	비회원_휴대폰번호 VARCHAR2(30) NOT NULL, /* 휴대폰번호 */
	상정_상영정보번호 NUMBER NOT NULL /* 상영정보번호 */
);

COMMENT ON TABLE ticketing IS '예매';

COMMENT ON COLUMN ticketing.예매_예매번호 IS '예매번호';

COMMENT ON COLUMN ticketing.예매_성인 IS '성인';

COMMENT ON COLUMN ticketing.예매_청소년 IS '청소년';

COMMENT ON COLUMN ticketing.예매_예매날짜 IS '예매날짜';

COMMENT ON COLUMN ticketing.예매_총가격 IS '총가격';

COMMENT ON COLUMN ticketing.회원_회원아이디 IS '회원아이디';

COMMENT ON COLUMN ticketing.비회원_휴대폰번호 IS '휴대폰번호';

COMMENT ON COLUMN ticketing.상정_상영정보번호 IS '상영정보번호';

CREATE UNIQUE INDEX PK_ticketing
	ON ticketing (
		예매_예매번호 ASC
	);

ALTER TABLE ticketing
	ADD
		CONSTRAINT PK_ticketing
		PRIMARY KEY (
			예매_예매번호
		);

/* 쿠폰 */
CREATE TABLE coupon (
	쿠폰_관람번호 VARCHAR2(30) NOT NULL, /* 관람번호 */
	쿠폰_관람권명 VARCHAR2(30) NOT NULL, /* 관람권명 */
	쿠폰_유효기간 DATE NOT NULL, /* 유효기간(시작) */
	쿠폰_종료기간 DATE NOT NULL /* 유효기간(끝) */
);

COMMENT ON TABLE coupon IS '쿠폰';

COMMENT ON COLUMN coupon.쿠폰_관람번호 IS '관람번호';

COMMENT ON COLUMN coupon.쿠폰_관람권명 IS '관람권명';

COMMENT ON COLUMN coupon.쿠폰_유효기간 IS '유효기간(시작)';

COMMENT ON COLUMN coupon.쿠폰_종료기간 IS '유효기간(끝)';

CREATE UNIQUE INDEX PK_coupon
	ON coupon (
		쿠폰_관람번호 ASC
	);

ALTER TABLE coupon
	ADD
		CONSTRAINT PK_coupon
		PRIMARY KEY (
			쿠폰_관람번호
		);

/* 회원쿠폰목록 */
CREATE TABLE M_CP_LIST (
	회쿠목_번호 NUMBER NOT NULL, /* 쿠폰발행숫자 */
	회원_회원아이디 VARCHAR2(100), /* 회원아이디 */
	회쿠목_내쿠폰번 VARCHAR2(30) /* 내쿠폰번호 */
);

COMMENT ON TABLE M_CP_LIST IS '회원쿠폰목록';

COMMENT ON COLUMN M_CP_LIST.회쿠목_번호 IS '쿠폰발행숫자';

COMMENT ON COLUMN M_CP_LIST.회원_회원아이디 IS '회원아이디';

COMMENT ON COLUMN M_CP_LIST.회쿠목_내쿠폰번 IS '내쿠폰번호';

CREATE UNIQUE INDEX PK_M_CP_LIST
	ON M_CP_LIST (
		회쿠목_번호 ASC
	);

ALTER TABLE M_CP_LIST
	ADD
		CONSTRAINT PK_M_CP_LIST
		PRIMARY KEY (
			회쿠목_번호
		);

/* 쿠폰가격비교 */
CREATE TABLE CP_COMPARE (
	쿠폰비교_목록 NUMBER NOT NULL, /* 목록 */
	가격_가격번호 VARCHAR2(30), /* 가격번호 */
	회쿠목_번호 NUMBER /* 쿠폰발행숫자 */
);

COMMENT ON TABLE CP_COMPARE IS '쿠폰가격비교';

COMMENT ON COLUMN CP_COMPARE.쿠폰비교_목록 IS '목록';

COMMENT ON COLUMN CP_COMPARE.가격_가격번호 IS '가격번호';

COMMENT ON COLUMN CP_COMPARE.회쿠목_번호 IS '쿠폰발행숫자';

CREATE UNIQUE INDEX PK_CP_COMPARE
	ON CP_COMPARE (
		쿠폰비교_목록 ASC
	);

ALTER TABLE CP_COMPARE
	ADD
		CONSTRAINT PK_CP_COMPARE
		PRIMARY KEY (
			쿠폰비교_목록
		);

ALTER TABLE screen
	ADD
		CONSTRAINT FK_cinema_TO_screen
		FOREIGN KEY (
			극장_극장번호
		)
		REFERENCES cinema (
			극장_극장번호
		)
		ON DELETE CASCADE;

ALTER TABLE seat
	ADD
		CONSTRAINT FK_screen_TO_seat
		FOREIGN KEY (
			상영관_상영관
		)
		REFERENCES screen (
			상영관_상영관
		)
		ON DELETE CASCADE;

ALTER TABLE screen_infor
	ADD
		CONSTRAINT FK_screen_TO_screen_infor
		FOREIGN KEY (
			상영관_상영관
		)
		REFERENCES screen (
			상영관_상영관
		)
		ON DELETE CASCADE;

ALTER TABLE screen_infor
	ADD
		CONSTRAINT FK_movie_infor_TO_screen_infor
		FOREIGN KEY (
			영화_영화번호
		)
		REFERENCES movie_infor (
			영화_영화번호
		)
		ON DELETE CASCADE;

ALTER TABLE pay_state
	ADD
		CONSTRAINT FK_pay_method_TO_pay_state
		FOREIGN KEY (
			결제방법_수단선택
		)
		REFERENCES pay_method (
			결제방법_수단선택
		)
		ON DELETE CASCADE;

ALTER TABLE pay_state
	ADD
		CONSTRAINT FK_ticketing_TO_pay_state
		FOREIGN KEY (
			예매_예매번호
		)
		REFERENCES ticketing (
			예매_예매번호
		)
		ON DELETE CASCADE;

ALTER TABLE price
	ADD
		CONSTRAINT FK_price_jojo_TO_price
		FOREIGN KEY (
			조조여부_조조
		)
		REFERENCES price_jojo (
			조조여부_조조
		)
		ON DELETE CASCADE;

ALTER TABLE price
	ADD
		CONSTRAINT FK_price_style_TO_price
		FOREIGN KEY (
			화면스타일_화면
		)
		REFERENCES price_style (
			화면스타일_화면
		)
		ON DELETE CASCADE;

ALTER TABLE price
	ADD
		CONSTRAINT FK_price_age_TO_price
		FOREIGN KEY (
			영화구분_연령
		)
		REFERENCES price_age (
			영화구분_연령
		)
		ON DELETE CASCADE;

ALTER TABLE ticketing
	ADD
		CONSTRAINT FK_member_TO_ticketing
		FOREIGN KEY (
			회원_회원아이디
		)
		REFERENCES member (
			회원_회원아이디
		)
		ON DELETE CASCADE;

ALTER TABLE ticketing
	ADD
		CONSTRAINT FK_non_member_TO_ticketing
		FOREIGN KEY (
			비회원_휴대폰번호
		)
		REFERENCES non_member (
			비회원_휴대폰번호
		)
		ON DELETE CASCADE;

ALTER TABLE ticketing
	ADD
		CONSTRAINT FK_screen_infor_TO_ticketing
		FOREIGN KEY (
			상정_상영정보번호
		)
		REFERENCES screen_infor (
			상정_상영정보번호
		)
		ON DELETE CASCADE;

ALTER TABLE M_CP_LIST
	ADD
		CONSTRAINT FK_member_TO_M_CP_LIST
		FOREIGN KEY (
			회원_회원아이디
		)
		REFERENCES member (
			회원_회원아이디
		)
		ON DELETE CASCADE;


ALTER TABLE CP_COMPARE
	ADD
		CONSTRAINT FK_price_TO_CP_COMPARE
		FOREIGN KEY (
			가격_가격번호
		)
		REFERENCES price (
			가격_가격번호
		)
		ON DELETE CASCADE;

ALTER TABLE CP_COMPARE
	ADD
		CONSTRAINT FK_M_CP_LIST_TO_CP_COMPARE
		FOREIGN KEY (
			회쿠목_번호
		)
		REFERENCES M_CP_LIST (
			회쿠목_번호
		)
		ON DELETE CASCADE;