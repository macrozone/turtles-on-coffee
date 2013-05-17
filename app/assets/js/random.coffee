#= require inc/jquery.js
#= require inc/jquery-ui-1.10.2.custom.min.js
#= require inc/bootstrap.min.js
#= require inc/canvasHelper.jquery.coffee

#= require inc/RandomLooperDrawer.coffee
#= require inc/Turtle.coffee




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
	drawer.setSpeed parseInt $("#speed").val(), 10
	$("#speed").on "change", -> 
		drawer.setSpeed parseInt $("#speed").val(), 10
	
	

	onCanvasClick = (e) ->
		console.log e
		angle = parseFloat $("#turtleAngle").val()
		startOrientation = angle * Math.ceil(Math.random()*(360/angle))
		drawer.addTurtle createTurtle e.pageX, e.pageY,startOrientation
		drawer.start()

	# put turtle on background on click on the background
	$(".hero-unit").click onCanvasClick
	$backgroundCanvas.click onCanvasClick

	createTurtle = (x,y, orientation) ->
		turtle = new Turtle $backgroundCanvas
		turtle.setColorRotatingAngle parseFloat $("#colorRotatingAngle").val()
		turtle.setConnectMode $("#connectMode").is ":checked"
		turtle.setStepWidth parseFloat $("#turtleStepWidth").val()
		turtle.setAngle parseFloat $("#turtleAngle").val()
		turtle.setStart x,y,orientation
		return turtle




	








