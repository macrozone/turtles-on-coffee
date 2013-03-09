#= require RandomLooperDrawer.coffee
#= require qualityCanvas.jquery.coffee
#= require Turtle.coffee
#= require lindenmayer.coffee

resizeCanvasWithWindow = ($backgroundCanvas) ->
		width = $(document).width()
		height = $(document).height()
		$backgroundCanvas.qualityCanvas "width", width
		$backgroundCanvas.qualityCanvas "height", height

setupBackGroundCanvas= () ->
	$backgroundCanvas = $("<canvas />")
	quality = 2
	$backgroundCanvas.qualityCanvas(quality: quality)
	$backgroundCanvas.css position: "absolute", top: 0, left: 0, "z-index": -10
	$backgroundCanvas.appendTo $ "body"
	resizeCanvasWithWindow($backgroundCanvas)
	$(window).resize ->
		resizeCanvasWithWindow $backgroundCanvas
	return $backgroundCanvas



$ () ->


	$backgroundCanvas = setupBackGroundCanvas()
	
	width = $(document).width()
	height = $(document).height()

	stepWidth = 30
	angle = 60

	drawer = new RandomLooperDrawer
	drawer.start()

	$("#clearBackground").on "click", ->
		drawer.clear()
		$backgroundCanvas.qualityCanvas "clear"
		false

	$(document).on "click", (e) ->
		drawer.addTurtle createTurtle(e.pageX, e.pageY,angle * (Math.ceil(Math.random()*(360/angle))))
		drawer.start()

	createTurtle = (x,y, orientation) ->
		turtle = new Turtle $backgroundCanvas
		turtle.setConnectMode false
		turtle.setStepWidth stepWidth
		turtle.setAngle angle
		turtle.setStart x,y,orientation
		return turtle

	


	


 		
 		
