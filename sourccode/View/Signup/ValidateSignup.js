function validateSignUp(){
		var userPassWord = document.formSignup.userPassWord.value;
		var pswRepeat = document.formSignup.psw_repeat.value;
		var userName = document.formSignup.userName.value;
		
		//kiểm tra dộ dài mật khẩu
		if(userPassWord.length < 6){
			alert("Độ dài mật khẩu tối thiểu 6 kí tự");
		}
		
		//kiểm tra xác thực mật khẩu
		if(userPassWord != "" && pswRepeat != ""){
			if(userPassWord != pswRepeat){
				alert("Mật khẩu không khớp nhau");
			}
		}
		
		//kiểm tra tên tài khoản
		var userNamePattern = /^[a-zA-Z0-9]+$/;
		if (!userNamePattern.test(userName)) {
	        alert("Tên tài khoản chỉ được chứa các ký tự chữ cái và số, không có khoảng trắng và dấu");
	    } 
	    
		return (userPassWord.length >= 6 && userPassWord == pswRepeat && userNamePattern.test(userName));
}