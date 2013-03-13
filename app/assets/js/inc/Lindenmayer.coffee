# global class, can be used globally on webserver or as a node-module
root = exports ? @

class root.Lindenmayer

	# R++L--R++
	setStartWord: (@word) ->

	getWord: () ->
		@word


	# array of something like that "F": "F++F++F"
	# 
	setProductions: (@productions) ->

	doSteps: (n) ->
		@doStep() for i in [1..n]

	doStep: ->

		for variable, replacement of @productions
			regex = new RegExp variable, "g" # replace all
			@word = @word.replace regex, replacement





