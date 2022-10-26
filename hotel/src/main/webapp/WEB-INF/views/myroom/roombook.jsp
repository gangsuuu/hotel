<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"  href="http://localhost:9000/hotel/resources/css/reservation.css">
<title>Insert title here</title>
</head>
<form name="login" action="bookinsertresult.do" method="post">
<body cz-shortcut-listen="true">
<fmt:parseDate value="${vo.radatestart}" var="radatestart" pattern="yyyyMMdd" />
<fmt:parseDate value="${vo.radateend}" var="radateend" pattern="yyyyMMdd" />

<div>
    <div class="title">
        <button class="back_btn" name="back_btn" onclick="history.go(-1);">&lt;</button>
        확인 및 결제
    </div>
</div>

<div class="row">
    <!--        숙소 날짜 및 결제 -->
    <div class="left_column">
        <!--        숙소 간략정보-->
        <div class="item" id="leftSideTop">
            <div class="tray">
                <div class="card">
                    <img src="http://localhost:9000/hotel/resources/upload/${vo.bsfile}" width="200">
                </div>
                <div class="img_desc">
                    <div>
                        <b id="hotelName">${vo.brname}</b>
                    </div>
                    <!-- <div style="font-size: 14px">
                        <p>
                            <span>인원 2명</span>&nbsp;
                            <span>침실 1개</span>&nbsp;
                            <span>침대 1개</span>&nbsp;
                            <span>욕실 1개</span>
                        </p>
                    </div> -->
                   
                </div>
            </div>
        </div>
        <div style="border-top: 1px #E6E6E6 solid;"></div>

        <!--        숙소 날짜 확인-->
        <div class="item" id="leftSideMiddle">
            <div class="item_title">예약날짜</div>
            <div class="reservation_tray">
                <div>
                    <input type="button" class="calendar_btn" name="daterange" value=
                    "<fmt:formatDate value="${radatestart}" pattern="yyyy.MM.dd" /> ~ <fmt:formatDate value="${radateend}" pattern="yyyy.MM.dd" />">
                </div>
            </div>
        </div>
        <div style="border-top: 1px #E6E6E6 solid;"></div>

        <div class="item" id="messageToHost">
            <div class="item_title">호텔에게 요구사항 보내기</div>
            <div class="sub_title">${vo.mid}님에게 여행 목적과 도착 예정 시간을 알려주세요.
            </div>
            <textarea class="message" placeholder="안녕하세요!"></textarea>
        </div>
        <div style="border-top: 1px #E6E6E6 solid;"></div>

        <!--        결제수단-->
        <!-- <div class="item" id="leftSideBottom">
            <div class="item_title">결제수단</div>
            <div class="payment">
                <button class="btn" id="kakaoPayBtn" value="nonClicked">
                    <img class="login_api_img" src="/static/images/payment_btn/payment_icon_yellow_medium.png">
                </button>
            </div>
        </div> -->

        <div style="border-top: 1px #E6E6E6 solid;"></div>
        <div>
            <input type="hidden" name="mid" id="mid" value="${vo.mid}"/>
			<input type="hidden" name="bid" id="bid" value="${vo.bid}"/>
            <input type="hidden" name="radatestart" id="radatestart" value="${vo.radatestart }"/>
			<input type="hidden" name="radateend" id="radateend" value="${vo.radateend }"/>
			<input type="hidden" name="price" id="price" value="${vo.price}"/>
            <input type="submit" id="paymentBtn" value="확인 및 결제">
        </div>
        <div style="font-weight: bold; font-size: 14px">* 환불규정은 공지사항에서 확인 가능합니다.</div>
    </div>
    <!--        숙소 결제-->
    <div class="right_column">
        <div class="item" id="rightSide">
            <div class="right_side_title">요금 세부정보</div>
            <!--                요금표시-->
            <div class="receipt">
                <div class="charge_detail">
                    <span id="per_day_cost">₩ <fmt:formatNumber value="${vo.price }" pattern="#,###" /></span>
                    
                    <span id="per_date">x ${vo.radateend-vo.radatestart }박</span>
                    <span class="charge"><fmt:formatNumber value="${vo.price * (vo.radateend-vo.radatestart)}" pattern="#,###" /></span>
                    <span class="currency_mark">₩</span>
                </div>

                <div class="charge_detail">
                    <span>청소비</span>
                    <span class="charge"> 고객 무료</span>
                    <span class="currency_mark">₩</span>
                </div>

                <div class="charge_detail">
                    <span>서비스 수수료</span>
                    <span class="charge"> 고객 무료</span>
                    <span class="currency_mark">₩</span>
                </div>

                <div class="charge_detail" id="chargeSum">
                    <span>총 합계</span>
                    <span class="charge" id="total"><fmt:formatNumber value="${vo.price * (vo.radateend-vo.radatestart)}" pattern="#,###" /></span>
                    <span class="currency_mark">₩</span>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <h5>Shilla Stay reservation site</h5>
</div>

<!--get_url-->
<script src="/static/js/get_url.js"></script>

<!--결제버튼, 카카오페이 API 결제하기-->
<script src="/static/js/api/kakao_pay_ready.js"></script>

<!--파파고 API 언어인식하기-->
<script src="/static/js/api/papago_api.js"></script>

<!--결제정보 관련 클래스-->
<script src="/static/js/classes/payment.js"></script>

<!--일정 그리고 숙박요금 계산-->
<script src="/static/js/room/reservation_date.js"></script>


<div class="daterangepicker ltr auto-apply show-calendar openscenter"><div class="ranges"></div>
<div class="drp-calendar left"><div class="calendar-table"></div>
<div class="calendar-time" style="display: none;"></div></div>
<div class="drp-calendar right"><div class="calendar-table"></div>
<div class="calendar-time" style="display: none;"></div></div>
<div class="drp-buttons"><span class="drp-selected"></span>
<button class="cancelBtn btn btn-sm btn-default" type="button">Cancel</button>
<button class="applyBtn btn btn-sm btn-primary" disabled="disabled" type="button">Apply</button>
 </div>
 </div>
</body>
</form>
</html>