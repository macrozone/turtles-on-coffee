#= require inc/WordDrawer.coffee
#= require inc/Turtle.coffee
#= require inc/Lindenmayer.coffee

# start settings

connectMode = false
speed = -1 # 0 is as fast as possible





# document loaded
$ () ->

	turtle = new Turtle $ "#background"
	turtle.setConnectMode connectMode
	
	drawer = new WordDrawer turtle
	drawer.setSpeed speed
	
	$("#process").click ->
		startWord = $("#startWord").val()
		productions = $("#productions").val()
		steps = $("#steps").val()

		turtle.setStepWidth parseInt $("#turtleStepWidth").val(),10
		turtle.setAngle parseInt $("#turtleAngle").val(), 10
		turtle.setStart parseInt($("#turtleStartX").val(),10), parseInt($("#turtleStartY").val(),10), parseInt($("#turtleOrientation").val(),10)
		



		# process

		lindenmayer = new Lindenmayer
		lindenmayer.setStartWord startWord
		lindenmayer.setProductions JSON.parse productions
		lindenmayer.doSteps steps

		word = lindenmayer.getWord()

		drawer.setWord word
		drawer.start()
	
	$("#clearBackground").on "click", -> drawer.clear()

	#

	#drawer.setSpeed speed



	

	
	



	
