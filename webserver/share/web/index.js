jQuery.fn.center = function() {
	this.css("position", "absolute");
	this.css("top", Math.max(0,
		(($(window).height() - $(this).outerHeight()) / 2) +
			$(window).scrollTop()) + "px");
	this.css("left", Math.max(0,
		(($(window).width() - $(this).outerWidth()) / 2) +
			$(window).scrollLeft()) + "px");
	return this;
}

var user = {
	login_url: "/nuri/u",
	api_signup_url: "/api/v1/user/signup",
	api_login_url: "/api/v1/user/authorize",
	api_main_url: "/api/v1/user/main",
	init: function() {
		$("div.button.submit.signup").click(user.signup);
		$("div.button.menu-login").click(function() {
			window.location.href = user.login_url;
		});
		$("div.button.submit.login").click(user.login);
	},
	signup: function() {
		var valid = true;
		var username = $("input.signup[name='username']").val();
		var email = $("input.signup[name='email']").val();
		var password = $("input.signup[name='password']").val();
		if (username.length < 5 || username.match(/^[a-zA-Z0-9]+$/) === null) {
			$("#username_message.signup").show().html("Minimum 5 characters/numbers only.");
			valid = false;
		} else {
			$("#username_message.signup").hide();
		}
		if (email.length < 5 || email.match(/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/) === null) {
			$("#email_message.signup").show().html("Invalid email address.");
			valid = false;
		} else {
			$("#email_message.signup").hide();
		}
		if (password.length < 8 || password.match(/[A-Z]/) === null || password.match(/[0-9]/) === null) {
			$("#password_message.signup").show().html("Minimum 8 characters with at least 1 capital and 1 number.");
			valid = false;
		} else {
			$("#password_message.signup").hide();
		}
		if (valid) {
			$.ajax({
				type: "POST",
				url: user.api_signup_url,
				dataType: "json",
				data: { client_id: username, client_password: password, client_email: email }
			}).done(function(res) {
				user.clear_signup();
				popup.show()
			}).fail(function(res) {
				var msg = "Signing up was failed.";
				try {
					var error = JSON.parse(res.responseText).error;
					error = error.replace("client_id", "username");
					error = error.replace("client_password", "password");
					error = error.replace("client_email", "email");
					msg = msg + " " + error;
				} catch (e) { }
				$("#submit_message.signup").show().html(msg);
			});
		}
	},
	login: function() {
		var client_id = $("input.login[name='username']").val();
		var client_password = $("input.login[name='password']").val();
		var url = user.api_login_url + "?client_id=" + client_id +
			"&client_password=" + client_password;
		$.get(url, function(data) {
			try {
				$("#submit_message.login").hide();
				window.location.href = user.api_main_url + "?client_id=" + client_id +
					"&client_token=" + data.token;
			} catch (e) {
				$("#submit_message.login").show().html("Login was failed (err2).");
			}
		}).fail(function(res) {
			var msg = "Login was failed (err1).";
			try {
				var error = JSON.parse(res.responseText).error;
				error = error.replace("client_id", "username");
				error = error.replace("client_password", "password");
				msg = msg + " " + error;
			} catch (e) { }
			$("#submit_message.login").show().html(msg);
		});
	},
	clear_signup: function() {
		$("#submit_message.signup").hide();
		$('#username_message.signup').hide();
		$('#password_message.signup').hide();
		$('#email_message.signup').hide();
		$("input.signup[name='username']").val("");
		$("input.signup[name='password']").val("");
		$("input.signup[name='email']").val("");
	}
};

var popup = {
	init: function() {
		$("div.popup-close").click(function() {
			$("div.popup").hide();
			$("div.popup-block").hide();
		});
		$(window).resize(function() {
			$("div.popup-block").css("width", $(window).width());
			$("div.popup-block").css("height", $(window).height());
		});
	},
	show: function() {
		$("div.popup-block").center().show();
		$("div.popup").center().show();
	},
}

$(function() {
	popup.init();
	user.init();
});
