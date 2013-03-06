#!/usr/bin/env ruby

require 'rubygems'
require 'json'

module Nuri
	module Planner
		module Graph
			ActionColor = 'white'
			ActionLabelWithParameters = false

			def self.clean(value)
				return value[2, value.length-2] if value[0,2] == '$.'
				return value
			end
			
			def self.get_label(action, withparameters=true)
				label = clean(action["name"])
				if withparameters and ActionLabelWithParameters
					label += "("
					if action["parameters"].length > 0
						action["parameters"].each { |key,value|
							label += "#{clean(key)}=#{clean(value.to_s)},"
						}
						label.chop!
					end
					label += ')'
				end
				return label
			end
			
			def self.partial2dot(json)
				dot = "digraph {\n"
			
				dot += "init_state [label=\"\", shape=doublecircle, fixedsize=true, width=0.35];\n"
				dot += "final_state [label=\"\", shape=doublecircle, style=filled, fillcolor=black, fixedsize=true, width=0.35];\n"
				last_actions = Hash.new
				json["workflow"].each { |action|
					dot += "#{action["id"]}[label=\"#{get_label(action)}\", shape=rect, style=filled, fillcolor=#{ActionColor}];\n"
					last_actions[action["id"].to_s] = action
				}
			
				json["workflow"].each { |action|
					has_predecessor = false
					action["predecessors"].each { |prevId|
						dot += "#{prevId} -> #{action["id"]};\n"
						has_predecessor = true
						last_actions.delete(prevId.to_s)
					}
					if not has_predecessor
						dot += "init_state -> #{action["id"]};\n"
					end
				}
			
				last_actions.each { |id,action|
					dot += "#{id} -> final_state;\n"
				}
			
				dot += "}"
			
				return dot
			end
			
			def self.stage2dot(json)
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
			
			def self.sequential2dot(json)
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
		end
	end
end

def main
	if ARGV.length < 1
		puts "Usage: sfw2dot.rb <input-file> [output-file]\n\n"
		exit
	end
	
	fp = open(ARGV[0], "rb")
	json = JSON.parse(fp.read)
	fp.close
	
	dot = ""
	case json["type"]
	when 'partial-order', 'parallel'
		dot = Nuri::Planner::Graph::partial2dot(json)
	when 'sequential'
		dot = Nuri::Planner::Graph::sequential2dot(json)
	when 'stage'
		dot = Nuri::Planner::Graph::stage2dot(json)
	else
		throw Exception, "Unrecognised type of workflow: #{json['type']}"
	end
	
	outfile = "/tmp/#{ARGV[0]}.dot"
	fp = open(outfile, "w");
	fp.write(dot)
	fp.close
	
	cmd = 'dot -Tpng -o';
	if ARGV.length > 1
		cmd += "#{ARGV[1]} #{outfile}"
	else
		cmd += ARGV[0].sub(/\.[a-zA-Z]*/,'') + ".png < #{outfile}"
	end
	system(cmd)
	File.delete(outfile)
end

main if __FILE__ == $0
