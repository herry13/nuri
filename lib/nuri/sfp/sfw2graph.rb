#!/usr/bin/env ruby

require 'rubygems'
require 'json'

def clean(value)
	return value[2, value.length-2] if value[0,2] == '$.'
	return value
end

def get_label(action)
	label = clean(action["name"]) + "("
	if action["parameters"].length > 0
		action["parameters"].each { |key,value|
			label += clean(key) + "=" + clean(value.to_s) + ","
		}
		label.chop!
	end
	label += ')'
	return label
end

def partial2dot(json)
	dot = "digraph {\n"

	dot += "init_state [label=\"\", shape=doublecircle, fixedsize=true, width=0.35];\n"
	dot += "final_state [label=\"\", shape=doublecircle, style=filled, fillcolor=black, fixedsize=true, width=0.35];\n"
	last_actions = Hash.new
	json["workflow"].each { |action|
		dot += action["id"].to_s + '[label="' + get_label(action) + '", shape=rect]' + ";\n"
		last_actions[action["id"].to_s] = action
	}

	json["workflow"].each { |action|
		has_predecessor = false
		action["predecessor"].each { |prevId|
			dot += prevId.to_s + " -> " + action["id"].to_s + ";\n"
			has_predecessor = true
			last_actions.delete(prevId.to_s)
		}
		if not has_predecessor
			dot += "init_state -> " + action["id"].to_s + ";\n"
		end
	}

	last_actions.each { |id,action|
		dot += id + " -> final_state;\n"
	}

	dot += "}"

	return dot
end

def stage2dot(json)
	dot = "digraph {\n"

	dot += "init_state [label=\"\", shape=doublecircle, fixedsize=true, width=0.35];\n"
	dot += "final_state [label=\"\", shape=doublecircle, style=filled, fillcolor=black, fixedsize=true, width=0.35];\n"
	index = 0
	prevState = "init_state"
	json["workflow"].each { |stage|
		id = 0
		stage.each { |action|
			dot += "a" + index.to_s + "a" + id.to_s + '[label="' + get_label(action) + '", shape=rect]' + ";\n"
			dot += prevState + " -> a" + index.to_s + "a" + id.to_s + ";\n"
			id += 1
		}
		if index < json["workflow"].length-1
			dot += "state" + index.to_s + ' [label="", shape=circle, fixedsize=true, width=0.35]' + ";\n"
			prevState = "state" + index.to_s
			id = 0
			stage.each { |action|
				dot += "a" + index.to_s + "a" + id.to_s + " -> " + prevState + ";\n"
				id += 1
			}
		else
			id = 0
			stage.each { |action|
				dot += "a" + index.to_s + "a" + id.to_s + " -> final_state;\n"
				id += 1
			}
		end
		index += 1
	}
	dot += "}"
	return dot
end

def sequential2dot(json)
	dot = "digraph {\n"

	dot += "init_state [label=\"\", shape=doublecircle, fixedsize=true, width=0.35];\n"
	dot += "final_state [label=\"\", shape=doublecircle, style=filled, fillcolor=black, fixedsize=true, width=0.35];\n"
	id = 0
	json["workflow"].each { |action|
		dot += id.to_s + '[label="' + get_label(action) + '", shape=rect]' + ";\n"
		id += 1
	}

	id = 0
	prevActionId = nil
	json["workflow"].each { |action|
		if id == 0
			dot += "init_state -> " + id.to_s + ";\n"
		elsif id == json["workflow"].length-1
			dot += id.to_s + " -> final_state;\n"
		end
		if prevActionId != nil
			dot += prevActionId.to_s + " -> " + id.to_s + ";\n"
		end
		prevActionId = id
		id += 1
	}
	dot += "}"
	return dot
end

if ARGV.length < 1
	puts "Usage: sfw2dot.rb <input-file> [output-file]\n\n"
	exit
end

fp = open(ARGV[0], "rb")
json = JSON.parse(fp.read)
fp.close

dot = ""

if json["type"] == "partial-order"
	dot = partial2dot(json)
elsif json["type"] == "sequential"
	dot = sequential2dot(json)
elsif json["type"] == "stage"
	dot = stage2dot(json)
end

outfile = "/tmp/" + ARGV[0] + ".dot"
fp = open(outfile, "w");
fp.write(dot)
fp.close

cmd = 'dot -Tpng -o';
if ARGV.length > 1
	cmd += ARGV[1] + ' ' + outfile
else
	cmd += ARGV[0].sub(/\.[a-zA-Z]*/,'') + '.png < ' + outfile
end
exec(cmd)
File.delete(outfile)
