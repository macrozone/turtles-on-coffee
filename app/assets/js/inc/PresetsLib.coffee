

# global class, can be used globally on webserver or as a node-module
root = exports ? @


class root.PresetsLib

	constructor: ->


		@presets = 
		[
			label: "Kochsche Scheeflocke"
			startWord: "F--F--F"


			productions: "F-> F+F--F+F"
			steps: 5	
			turtleStepWidth: 2
			turtleAngle: 60
			turtleStartX: 400
			turtleStartY: 500
			turtleOrientation: 0
			colorRotatingAngle: 0.1
		,
			label: "Sierpinski-Dreieck"
			startWord: "FXF--FF--FF"



			productions: "X -> --FXF++FXF++FXF--,F -> FF"
			steps: 8
			turtleStepWidth: 1
			turtleAngle: 60
			turtleStartX: 400
			turtleStartY: 500
			turtleOrientation: 0
			colorRotatingAngle: 0.01
		,
			label: "Lévy-C-Kurve"
			startWord: "F"
			productions: "F -> +F--F+"
			steps: 22
			turtleStepWidth: 2
			turtleAngle: 45
			turtleStartX: 400
			turtleStartY: 500
			turtleOrientation: 0
			colorRotatingAngle: 0.01
		,
			label: "Peano"
			startWord: "X"


			productions: "X -> XFYFX+F+YFXFY-F-XFYFX,Y -> YFXFY-F-XFYFX+F+YFXFY"
			steps: 5	
			turtleStepWidth: 10
			turtleAngle: 90
			turtleStartX: 400
			turtleStartY: 500
			turtleOrientation: 0
			colorRotatingAngle: 1
		,
			label: "Drachenkurve"
			startWord: "R"


			productions: "R -> +R--L+,L -> -R++L-"
			steps: 15	
			turtleStepWidth: 4
			turtleAngle: 45
			turtleStartX: 200
			turtleStartY: 200
			turtleOrientation: 0
			colorRotatingAngle: 1
		,
			label: "Quadratur des Dreiecks"
			startWord: "F"
			productions: "F -> G++G, G -> F-F"
			steps: 12
			turtleStepWidth: 4
			turtleAngle: 90
			turtleStartX: 200
			turtleStartY: 200
			turtleOrientation: 45
			colorRotatingAngle: 0.05


		]



	getPresets: ->
		@presets
