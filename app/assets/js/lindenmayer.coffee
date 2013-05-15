#= require inc/WordDrawer.coffee
#= require inc/Turtle.coffee
#= require inc/Lindenmayer.coffee
#= require inc/PresetsLib.coffee

# start settings

connectMode = false
speed = 100000 # 0 is as fast as possible


canvasWidth = 4000
canvasHeight = 4000
canvasScrollOffsetX = 2000
canvasScrollOffsetY = 2000

# document loaded
$ () ->
	presetsLib = new PresetsLib

	# dom elements
	$canvas = $ "#lindenmayerCanvas"

	$presets = $ "#presets"
	$process = $ "#process"
	$startWord = $ "#startWord"
	$productions = $ "#productions"
	$steps = $ "#steps"
	$turtleStepWidth = $ "#turtleStepWidth"
	$autoStepWidth = $ "#autoStepWidth"
	$turtleAngle = $ "#turtleAngle"
	$turtleStartX = $ "#turtleStartX"
	$turtleStartY = $ "#turtleStartY"
	$turtleOrientation = $ "#turtleOrientation"
	$colorRotatingAngle = $ "#colorRotatingAngle"

	# functions
	setupCanvas = ($canvas) ->
		

		$canvas.canvasHelper quality: 2
		$canvas.canvasHelper "width", canvasWidth
		$canvas.canvasHelper "height", canvasHeight
		$canvas.parent().scrollLeft canvasScrollOffsetX
		$canvas.parent().scrollTop canvasScrollOffsetY
		

	loadPreset = (preset) ->

		

		$startWord.val preset.startWord
		$productions.val preset.productions.replace /,/g, ",\n"
		$steps.val preset.steps
		$turtleStepWidth.val preset.turtleStepWidth

		$turtleAngle.val preset.turtleAngle
		$turtleStartX.val preset.turtleStartX
		$turtleStartY.val preset.turtleStartY
		$turtleOrientation.val preset.turtleOrientation
		$colorRotatingAngle.val preset.colorRotatingAngle


	process = ->
		startWord = $startWord.val()
		productions = $productions.val()
		steps = $steps.val()


		stepWidth = parseInt $turtleStepWidth.val(),10
		autoStepWidth = $autoStepWidth.is ":checked"
		
		if autoStepWidth
			turtle.setStepWidth stepWidth / Math.pow 3, steps
		else
			turtle.setStepWidth stepWidth

		turtle.setAngle parseInt $turtleAngle.val(), 10
		turtle.setStart parseInt($turtleStartX.val(),10)+canvasScrollOffsetX, parseInt($turtleStartY.val(),10)+canvasScrollOffsetY, parseInt($turtleOrientation.val(),10)
		turtle.setColorRotatingAngle parseFloat $colorRotatingAngle.val()

		# process

		lindenmayer = new Lindenmayer
		lindenmayer.setStartWord startWord
		lindenmayer.setProductionsString productions
		
		lindenmayer.doSteps steps

		word = lindenmayer.getWord()
		
		drawer.setWord word
		drawer.start()
	
	


	# init presets
	presets = presetsLib.getPresets()

	$.each presets, (index, preset) ->
		$preset = $ '<option value="'+index+'">'+preset.label+'</option>';
		$presets.append $preset

	$presets.on "change", ->
		index = $(this).find("option:selected").val()
		preset = presets[index]
		loadPreset preset

	
	# 
	
	setupCanvas $canvas
	turtle = new Turtle $canvas
	turtle.setConnectMode connectMode
	
	drawer = new WordDrawer turtle
	drawer.setSpeed speed



	$process.on "click", process
	
	$(".clearBackgroundButton").on "click", -> 
		drawer.clear()
		$canvas.canvasHelper "clear"

	

	#drawer.setSpeed speed


	




	

	
	



	
