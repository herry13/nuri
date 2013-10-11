$(function() {
	$('div#main').text('This is Nuri as a Service.');
});

var menu = {
	specification: function() {
		$('div#main').text('Specification');
	},
	state: function() {
		$('div#main').text('State');
	},
	modules: function() {
		$('div#main').text('Modules');
	},
	logs: function() {
		$('div#main').text('Logs');
	}
};
