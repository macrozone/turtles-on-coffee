# global class, can be used globally on webserver or as a node-module
root = exports ? @


class root.DrawerAbstract
	interval: 0
	running: false
	speed: 1000

	constructor: (@turtles...) ->

	# draws per second
	# if its over 1000, it will do multiple steps per tick
	# it should then be a multipe of 1000
	# set 0 for infitit (carefull)
	setSpeed: (@speed) ->

	addTurtle: (turtle) ->
		@turtles.push turtle
		
	start: ->
		if not @running
			if @speed > 0
				delay = 1000 / @speed
				repeats = Math.ceil @speed / 1000
			else 
				delay = 0
				repeats = 1
			@running = true
			@interval = setInterval =>
				@step() for i in [1..repeats]
			, delay

	stop: ->
		@running = false
		clearInterval @interval
	clear: ->
		@stop()

	removeTurtles: ->
		@turtles = []
	

	step: ->
		@turtleStep turtle for turtle in @turtles

