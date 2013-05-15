

# global class, can be used globally on webserver or as a node-module
root = exports ? @


class root.PresetsLib

	constructor: ->


		@presets = 
		[
			label: "Quadratur des Kreises"
			startWord: "F"
			productions: "F -> G++G, G -> F-F"
			steps: 8
			turtleStepWidth: 4
			turtleAngle: 90
			turtleStartX: 200
			turtleStartY: 200
			turtleOrientation: 0


		]



	getPresets: ->
		@presets
