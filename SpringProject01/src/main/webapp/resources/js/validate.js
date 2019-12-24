function validateEmail(email){
	var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return re.test(email);
}
function validatePhone(phone) {
	var re = /^\d{2,3}-\d{3,4}-\d{4}$/;
	return re.test(phone);
}