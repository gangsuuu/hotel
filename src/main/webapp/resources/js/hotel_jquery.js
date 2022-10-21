$(document).ready(function(){

		//제목에 대한 이벤트 처리
		$(".reclass").click(function(){
			//alert("제목클릭;; iid=" + $(this).attr("id"));
			replyContent($(this).attr("id"));
			//$(location).attr("href","inquiry_content.do");
		
		});		
		
		//문의글 답변 상세보기 출력
		function replyContent(iid){
			//alert("상세보기 iid="+iid);
			$.ajax({
				url : "admin_reply_content_json.do?iid="+iid,
				success : function(result){
					alert(result);
					let data = JSON.parse(result);
					
					let text = "<table class='replytable'>";
					text += "<tr>";
					text += "<th>작성자</th>";
					text += "<td>관리자</td>";
					text += "<th>등록일자</th>";
					text += "<td>"+ data.redate +"</td>";
					text += "</tr>";
					text += "<tr>";
					text += "<td colspan=''>"+ data.recontent +"</td>";
					text += "</tr>";
					text += "</table>";
				
					//출력
					$(".customerBoard").after(text);
					
				}//success
				
			});//ajax
			
		}

});