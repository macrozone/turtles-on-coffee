# global class, can be used globally on webserver or as a node-module
root = exports ? @

class root.Turtle
	qualityFactor: 1
	stepWidth: 10
	x: 0
	y: 0
	orientation: 0
	angle: 90
	connectMode: false

	constructor: ($canvas) ->
		@colorAngle = 1
		@color = hue:0, saturation: 100, lightness: 50
		@setCanvas $canvas

	setCanvas: ($canvas) ->
		@context = $canvas.get(0).getContext "2d"
		@qualityFactor = $canvas.canvasHelper "quality"

	setColor: (@color) ->

	setColorRotatingAngle: (@colorAngle) ->

	getColorHSLString: ->
		"hsl(#{@color.hue}, #{@color.saturation}%, #{@color.lightness}%)"
	setStart: (@x, @y, @orientation) ->
		@jump()

	setStepWidth: (@stepWidth) ->

	setAngle: (@angle) ->

	# set connectMode if you have multiple turtles working on the same context
	# and want to connect the lines between the turtles
	setConnectMode: (@connectMode) ->

	jump: () ->

		@context.moveTo @getNormalized(@x), @getNormalized(@y)


	move: () ->

		@context.lineWidth  = 1
		@context.strokeStyle = @getColorHSLString()
		@context.lineTo @getNormalized(@x), @getNormalized(@y)
		@context.stroke()
		@context.beginPath() unless @connectMode

	# normalize the coordinates so that it fits correctly and takes care of the qualityFactor
	getNormalized: (position) ->
		# the 0.5 is needed, see 
		# https://developer.mozilla.org/en-US/docs/HTML/Canvas/Tutorial/Applying_styles_and_colors?redirectlocale=en-US&redirectslug=Canvas_tutorial%2FApplying_styles_and_colors#section_8
		0.5 + Math.round @qualityFactor*position

	## controls ##
	# to a step forward
	forward: () ->

		# jump is needed if multiple turtles are working on the same canvas
		# if you set connectMode = true, the lines that the turtles draw are always connected
		@jump() unless @connectMode

		# just the ordinary coordinate transformation
		@x += @stepWidth * Math.cos @orientation * Math.PI / 180
		@y += @stepWidth * Math.sin @orientation * Math.PI / 180
	
		@move()
		@rotateColor()

	rotateColor: ->
		if @colorAngle != 0
			@color.hue = (@color.hue+@colorAngle) % 360


	
	turnLeft: () ->
		@orientation -= @angle

	turnRight: () ->
		@orientation += @angle

