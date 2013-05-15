#= require inc/jquery.js
#= require inc/jquery-ui-1.10.2.custom.min.js
#= require inc/bootstrap.min.js
#= require inc/canvasHelper.jquery.coffee

#= require inc/RandomLooperDrawer.coffee
#= require inc/Turtle.coffee


# settings
stepWidth = 10
angle = 60
connectMode = false
speed = 1000



resizeCanvasWithWindow = ($canvas) ->
	width = $(document).width()
	height = $(document).height()
	$canvas.canvasHelper "width", width
	$canvas.canvasHelper "height", height

setupBackGroundCanvas= () ->
	$backgroundCanvas = $("<canvas />").attr "id", "background"
	quality = 2
	$backgroundCanvas.canvasHelper(quality: quality)
	$backgroundCanvas.css position: "absolute", top: 0, left: 0, "z-index": -10
	$backgroundCanvas.appendTo $ "body"
	resizeCanvasWithWindow($backgroundCanvas)
	$(window).resize ->
		resizeCanvasWithWindow $backgroundCanvas
	return $backgroundCanvas
	



# document loaded
$ () ->
	#init background
	$backgroundCanvas = setupBackGroundCanvas()

	$(".clearBackgroundButton").on "click", ->
		$backgroundCanvas.canvasHelper "clear"
		false

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




	








