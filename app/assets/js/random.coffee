#= require inc/RandomLooperDrawer.coffee
#= require inc/Turtle.coffee


# settings
stepWidth = 30
angle = 60
connectMode = false
speed = 0 # as fast as possible


# document loaded
$ () ->
	$("#clearBackground").on "click", -> drawer.clear()

	$backgroundCanvas = $ "#background"

	drawer = new RandomLooperDrawer
	drawer.setSpeed speed
	
	# put turtle on background on click on the background
	$("body").click (e) ->
		startOrientation = angle * Math.ceil(Math.random()*(360/angle))
		drawer.addTurtle createTurtle e.pageX, e.pageY,startOrientation
		drawer.start()

	createTurtle = (x,y, orientation) ->
		turtle = new Turtle $backgroundCanvas
		turtle.setConnectMode connectMode
		turtle.setStepWidth stepWidth
		turtle.setAngle angle
		turtle.setStart x,y,orientation
		return turtle
