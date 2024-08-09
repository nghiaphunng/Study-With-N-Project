let notify_popup = document.getElementById("notify_popup_window");
let comment_popup = document.getElementById("comment_popup_window");
let contact_popup = document.getElementById("contact_popup_window");

function openNotifyPopup(){
	notify_popup.classList.add("open-popup");
}
function closeNotifyPopup(){
	notify_popup.classList.remove("open-popup");
}
function openCommentPopup(){
	comment_popup.classList.add("open-popup");
}
function closeCommentPopup(){
	comment_popup.classList.remove("open-popup");
}
function openContactPopup(){
	contact_popup.classList.add("open-popup");
}
function closeContactPopup(){
	contact_popup.classList.remove("open-popup");
}
