function sendIt(){
	var f = document.loginF;
	
	if(!f.userId.value){
		alert("id를 입력하세요!");
		f.userId.focus();
		return;
	}
	
	if(!f.userPasswd.value){
		alert("비밀번호를 입력하세요!");
		f.userPasswd.focus();
		return;
	}
	
	f.action = "/mg/LoginPro.do";
	f.submit();
	
}

/*$(document).ready(function () {
	$("#login").click(function(){
		var query = {id : $("#inputID").val(), 
				     passwd:$("#inputPassword").val()};
		  
		$.ajax({
		   type: "POST",
		   url: "/SclabWeb/mg/LoginPro.do",
		   data: query,
		   success: function(data){
		   	window.location.href("/SclabWeb/map/Map.do");	
		   }
		});

	});
});*/