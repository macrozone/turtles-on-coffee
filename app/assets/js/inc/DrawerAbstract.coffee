# global class, can be used globally on webserver or as a node-module
root = exports ? @


class root.DrawerAbstract
	

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
			@running = true
			@step()
			
		
	getStepTimeout: ->
		Math.floor 1000/@speed

	stop: ->
		@running = false
	clear: ->
		@stop()

	removeTurtles: ->
		@turtles = []
	

	step: ->
		
		if @running

			multiSteps = Math.floor @speed /1000

			for i in [0..multiSteps-1]
				
				for turtle in @turtles
					@turtleStep turtle 
					

			window.setTimeout =>
				@step()
			,@getStepTimeout()


