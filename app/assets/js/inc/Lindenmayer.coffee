#= require Tools.coffee
# global class, can be used globally on webserver or as a node-module
root = exports ? @

class root.Lindenmayer

	# R++L--R++
	setStartWord: (@word) ->

	getWord: () ->
		@word


	setProductionsString: (fullString) ->
		# parse it
		productions = {}

		for oneProduction in fullString.split ","
			# trim it
			oneProduction = Tools.trim oneProduction
			
			[key, value] = oneProduction.split "->"
			key = Tools.trim key
			value = Tools.trim value
			console.log key, value
			productions[key] = value


		@setProductions productions

	# array/object of something like that "F": "F++F++F"
	# 
	setProductions: (@productions) ->

	doSteps: (n) ->
		if n > 0
			@doStep() for i in [1..n]

	doStep: ->

		for variable, replacement of @productions
			regex = new RegExp variable, "g" # replace all
			@word = @word.replace regex, replacement





