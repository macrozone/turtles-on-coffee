#= require inc/WordDrawer.coffee
#= require inc/Turtle.coffee
#= require inc/Lindenmayer.coffee

# start settings

connectMode = false
speed = -1 # 0 is as fast as possible



setupCanvas = ($canvas) ->
	$canvas.attr "width",$canvas.parent().width()
	$canvas.attr "height", 1000

	quality = 2
	$canvas.canvasHelper(quality: quality)
	$(window).resize ->
		$canvas.attr "width",$canvas.parent().width()
		$canvas.attr "height", 1000


# document loaded
$ () ->

	$canvas = $ "#lindenmayerCanvas"
	
	setupCanvas $canvas
	turtle = new Turtle $canvas
	turtle.setConnectMode connectMode
	
	drawer = new WordDrawer turtle
	drawer.setSpeed speed
	
	$("#process").click ->
		startWord = $("#startWord").val()
		productions = $("#productions").val()
		steps = $("#steps").val()


		stepWidth = parseInt $("#turtleStepWidth").val(),10
		autoStepWidth = $("#autoStepWidth").is ":checked"
		
		if autoStepWidth
			turtle.setStepWidth stepWidth / Math.pow 3, steps
		else
			turtle.setStepWidth stepWidth

		turtle.setAngle parseInt $("#turtleAngle").val(), 10
		turtle.setStart parseInt($("#turtleStartX").val(),10), parseInt($("#turtleStartY").val(),10), parseInt($("#turtleOrientation").val(),10)


		# process

		lindenmayer = new Lindenmayer
		lindenmayer.setStartWord startWord
		lindenmayer.setProductionsString productions
	
		lindenmayer.doSteps steps

		word = lindenmayer.getWord()

		drawer.setWord word
		drawer.start()
	
	$("#clearBackground").on "click", -> 
		drawer.clear()
		$canvas.canvasHelper "clear"

	#

	#drawer.setSpeed speed



	

	
	



	
