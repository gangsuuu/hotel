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

function changeDrawing(type){
	$(".selected-drawing-btn").removeClass("selected-drawing-btn");
	$("a[data-room="+type+"]").addClass("selected-drawing-btn");
	$(".selected-drawing").removeClass("selected-drawing");
	$("div[data-room="+type+"]").addClass("selected-drawing");
}