#= require DrawerAbstract.coffee

# global class, can be used globally on webserver or as a node-module
root = exports ? @

class root.WordDrawer extends root.DrawerAbstract
	

	setWord: (@word) ->


	turtleStep: (turtle) ->

		if @word.length == 0 then @stop()
		else
			char = @word.charAt 0
			@word = @word.slice 1


			switch char
				when '-' then turtle.turnLeft() 
				when '+' then turtle.turnRight() 
				else 
					if char.toUpperCase() == char then turtle.forward()

