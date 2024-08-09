function TogglePopupPost() {
    var overlay = document.getElementById('popupPost');
    overlay.classList.toggle('show');
	//reset form nhập
    if (overlay.classList.contains('show')) {
        document.querySelector('form[name="form_up_post"] select[name="post_scope"]').value = "0";
        document.querySelector('form[name="form_up_post"] input[name="title_post"]').value = "";
        document.querySelector('form[name="form_up_post"] textarea[name="content_post"]').value = "";
    }
}

function TogglePopupUpdateAvatar() {
    var overlay = document.getElementById('popupUpdateAva');
    overlay.classList.toggle('show');
}

function TogglePopupShowAvatar() {
    var overlay = document.getElementById('popupShowAva');
    overlay.classList.toggle('show');
}

function TogglePopupCommentPost(postid) {
    var overlay = document.getElementById('popupCommentPost-'+postid);
    overlay.classList.toggle('show');
}

function TogglePopupLikePost(postid) {
    var overlay = document.getElementById('popupLikePost-'+postid);
    overlay.classList.toggle('show');
}