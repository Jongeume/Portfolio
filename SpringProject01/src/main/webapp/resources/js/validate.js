function validateEmail(email){
	var re = /^[0-9a-zA-z]{4}([-_\.]?[0-9a-zA-Z])*@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}
function validatePhone(phone) {
	var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
	return re.test(phone);
}
function validateName(name){
	var re = /^[가-힣\x20]{2,5}$/;
	return re.test(name);
}
function validatePassword(password){
	var re = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.\w)).{8,12}$/;
	return re.test(password);
}
function validateNickname(nickname){
	var re = /^[0-9a-zA-Z가-힣\x20]{2,10}$/;
	return re.test(nickname);
}
