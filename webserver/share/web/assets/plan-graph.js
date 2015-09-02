var srcUrl = "https://www.nurilabs.com/api/v1/planner/1412329608758479590490";

var PlanGraph = function(elementIdent) {
	var id = elementIdent,
		jid = '#' + id,
		margin = {top: 20, right: 100, bottom: 20, left: 100},
		width = 800,
		height = 400,
		duration = 750,
		innerWidth = width - margin.left - margin.right,
		innerHeight = height - margin.top - margin.bottom;

	$(jid).css('width', width + 'px');
	$(jid).css('height', height + 'px');

	var actions,
		i = 0,
		root;
	var tree = d3.layout.tree()
		.size([innerHeight, innerWidth]);
	var diagonal = d3.svg.diagonal()
		.projection(function(d) { return [d.y, d.x]; });

	var svg = d3.select(jid).append('svg')
		.attr('width', width)
		.attr('height', height)
		.append('g')
		.attr('transform', 'translate(' + margin.left + ',' + margin.top + ')');

	var updateNode = function(source) {
console.log(source);
	};

	this.draw = function(plan) {
		actions = plan.actions
		root = {
			name: "initial",
			before: [],
			after: [],
			x0: innerHeight / 2,
			y0: 0
		};
		for (var i = 0; i < actions.length; i++) {
			if (actions[i].before.length <= 0) {
				root.after.push(i);
			}
		}
		updateNode(root);
		return this;
	};
};

$(function() {
	var pg = new PlanGraph('plan-graph');
	$.get(srcUrl, function(res) {
		pg.draw(res.plan);
	}).fail(function(res) {
		alert("Cannot load data.");
	});
});
