#= require DrawerAbstract.coffee

# global class, can be used globally on webserver or as a node-module
root = exports ? @

class root.RandomLooperDrawer extends root.DrawerAbstract
	

	turtleStep: (turtle) ->
		id = Math.floor(Math.random() * 2)
		switch id
			when 0 then turtle.turnLeft() 
			when 1 then turtle.forward() 
			

