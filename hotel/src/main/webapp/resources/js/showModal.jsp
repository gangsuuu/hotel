function showModalBackground(){
	$(".modal-background").css("display","block");
}

function showModal(name){
	showModalBackground()
	$("#"+name+"modal").css("display","block");
}

$(".modal-close").click(function(){
	$(".modal-background").css("display","none");
	$(".content-modal").css("display","none");			
})