<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div, ul, ol, li ,dl , dt , dd { list-style:none; margin:0; padding:0;}
	.localBox{ background-image:none;background-color:#ebe7e3; height:100px;}
	.localBox .localBoxer { width:1200px; margin:0 auto 0 auto; overflow:hidden; background: #ebe7e3;}
	
	/* localBox css */
	.localBox .linkInfo {
		background : url(http://localhost:9000/hotel/resources/img/localBoxLinkInfo.gif) no-repeat transparent;
		position : relative;
		float : left;
		width : 553px;
		height : 100px;
	}
	
	.localBox .linkInfo li{position:absolute;top:35px;}
	.localBox .linkInfo a{ display:block;width:100%;height:30px;overflow:hidden;background-color:transparent;text-indent:-9999%}
	.localBox .linkInfo li.m1{left:57px;width:82px;}
	.localBox .linkInfo li.m2{left:139px;width:65px;}
	.localBox .linkInfo li.m3{left:204px;width:77px;}
	/************************/
	
	/* snsBox css */
	.foot .localBox .snsNews{ float:right; width:117px; height:100px; position:relative} /* sns  메뉴 위치 수정 20210419 수정 */
	.foot .localBox .snsNews .sns{ position:absolute; left:0; top:39px;}
	.foot .localBox .snsNews .sns .dt{float:left; background:url(http://localhost:9000/hotel/resources/img/localBoxSnsNews.gif) no-repeat 0 -39px; width:33px; height:23px; text-indent:-9999%; overflow:hidden; }
	.foot .localBox .snsNews .sns dd{ float:left; margin:0 0 0 5px;}
	.foot .localBox .snsNews .sns dd a{ width:23px; height:23px; background:url(http://localhost:9000/hotel/resources/img/localBoxSnsNews.gif); vertical-align:middle; display: block; overflow:hidden; line-height:100px;text-indent:-9999%;}
	.foot .localBox .snsNews .sns .facebook a{background-position:-38px -39px;}
	.foot .localBox .snsNews .sns .blog a{background-position:-66px -39px;}
	.foot .localBox .snsNews .sns .instagram a{background-position:-94px -39px;}
	/***********************/
	
	/* linkBox css */
	.footer{ width:1200px; margin:0 auto; height:161px; position:relative; overflow:hidden;}
	.footer .linkBox{position:absolute;left:0;top:0;width: 590px;height: 60px; justify-content: space-between; font-size:12px;}
	.footer .linkBox ul{position:absolute;left:0px;top:25px;width:909px;}
	.footer .linkBox li{ float:left;height:14px;}
	.footer .linkBox p.link0 { width:101px; height:60px; display:block; /* background:url(../../images/ko/common/layout/PHGLogo.gif) no-repeat; */ /* text-indent:-9999%; */}
	.footer .linkBox li a{ font-weight:bold; color:rgb(153,153,153); height:14px; display:block;margin:0; /* background:url(http://localhost:9000/hotel/resources/img/footLinkBox.gif) no-repeat; *//* text-indent:-9999%; */ overflow:hidden;}
	.footer .linkBox li.link1 a{ width:103px; background-position:0 0; color:rgb(108,108,108);}
	.footer .linkBox li.link2 a{ width:77px; background-position:-104px 0; color:rgb(108,108,108);}
	.footer .linkBox li.link3 a{ width:124px; background-position:-181px 0; color:rgb(172,138,110);}
	.footer .linkBox li.link4 a{ width:136px; background-position:-305px 0; color:rgb(184,184,184);}
	.footer .linkBox li.link5 a{ width:117px; background-position:-441px 0; color:rgb(184,184,184);}
	.footer .linkBox.noLogo p.link0{/* display:none; */}
	.footer .linkBox.noLogo ul{left:0;width:1200px;}
	
	/***********************/	
	
	/* selectLang */	
	.footer .selectLang{position:absolute; right:0; top:23px;}
	.footer .selectLang li{ float:left; margin:0;}
	.footer .selectLang li a{ background:url(http://localhost:9000/hotel/resources/img/footSelectLang.gif) no-repeat; 
	                          height:14px; display:block; text-indent:-9999%; overflow:hidden;}
	.footer .selectLang li.en a{ width:60px; background-position:0 0}
	.footer .selectLang li.ja a{ width:55px; background-position:-60px 0}
	.footer .selectLang li.zh a{ width:61px; background-position:-115px 0}
	/*************/	
	
	hr { display: block; position: relative; top: 47px; padding: 0 3px;
		border-top:rgb(184,184,184); background-color: rgb(184,184,184);}

	.compInfo { position : relative; float : left; width : 158px; height : 100px}
	.compInfo p { text-align:center; margin:0; margin-top:36px; margin-left:26px; }
	.compInfo a { text-decoration:none; font-size:20px; color:rgb(153,153,153); font-weight:bold; }
	
	.footer .adressBox{
		position:absolute; 
		left:0; top:7px; height:23px; width:1200px; 
		display:block; line-height:20px; top:70px;/* overflow:hidden; */
		/*border: 1px solid #8c8c8c; padding-top: 7px*/
		/* text-indent:-9999% */
	}
	
	.footer .adressBox p { padding:0; margin:0; font-size:13px; color:rgb(184,184,184); font-weight:bold;}
		
	/* .selectLang ul{
		display:flex; text-indent: 10px; float: right; width:194px; padding: 0;
		list-style : none;
	} */
	
</style>
</head>
<body>
	<footer>
		<div class="foot hub_foot footdongtan">
			<div class="localBox">
				<div class="localBoxer">
					<div class="compInfo">
						<a href="index.do"><p class="logo">브랜드이름</p></a>
					</div>
					<div class="linkInfo">
						<ul class="Infolst">
							<li class="m1"><a href="#">호텔 소식</a></li>
							<li class="m2"><a href="#">게시판</a></li>
							<li class="m3"><a href="#">고객문의</a></li>
						</ul>
					</div>
					<div class="snsNews">
						<dl class="sns">
							<dt class="dt">SNS</dt>
							<dd class="facebook"><a title="Facebook - popup" target="_blank" href="#"><span>Facebook</span></a></dd>
							<dd class="instagram"><a title="Instagram - popup" target="_blank" href="#"><span>instagram</span></a></dd>
							<dd class="blog"><a title="Blog - popup" target="_blank" href="#"><span>Blog</span></a></dd>
						</dl>
					</div>
				</div>
			</div>
			<div class="footer">
				
				<div class="linkBox">
					<ul>
						<li class="link1"><a href="#">브랜드이름소개</a></li>
						<li class="link2"><a href="#">사이트맵</a></li>
						<li class="link3"><a href="#">개인정보취급방침</a></li> 
						<li class="link4"><a href="#">이메일무단수집금지</a></li>
						<li class="link5"><a href="#">윤리경영(부정제보)</a></li>
					</ul>
				</div>
				
				<div class="selectLang">
					<ul>
						<li class="en first"><a href="#">English</a></li>
						<li class="ja"><a href="#">日本語</a></li>
						<li class="zh last"><a href="#">简体中文</a></li>
						</ul>
				</div>
			
				<div class="adressBox">
					<p>신라스테이 주식회사    서울특별시 중구 다산로 210  (우 : 04586) 대표이사 박상오 </p>
					<p>사업자등록번호 201-86-40254 통신판매신고번호 중구0882호 TEL. 02-2230-3000   FAX. 02-2230-3800</p>
					<p>COPYRIGHT © HOTEL SHILLA CO., LTD. ALL RIGHTS RESERVED.</p>
				</div>
				<hr>
			</div>
		</div>
	
	</footer>
</body>
</html>