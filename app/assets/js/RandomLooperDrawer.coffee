class window.RandomLooperDrawer
	interval: 0
	running: false
	speed: 1000

	constructor: (@turtles...) ->

	# draws per second
	# if its over 1000, it will do multiple steps per tick
	# it should then be a multipe of 1000
	setSpeed: (@speed) ->

	addTurtle: (turtle) ->
		@turtles.push turtle
		
	start: ->
		if not @running

			delay = 1000 / @speed
			repeats = Math.ceil @speed / 1000
			console.log repeats
			@running = true
			@interval = setInterval =>
				@step() for i in [1..repeats]
			, delay

	stop: ->
		@running = false
		clearInterval @interval
	clear: ->
		@stop()
		@turtles = []

	step: ->
		@turtleStep turtle for turtle in @turtles

	turtleStep: (turtle) ->
		id = Math.floor(Math.random() * 2)
		switch id
			when 0 then turtle.turnLeft() 
			when 1 then turtle.forward() 
			when 2 then turtle.turnRight() 

