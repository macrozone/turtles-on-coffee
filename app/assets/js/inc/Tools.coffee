
# global class, can be used globally on webserver or as a node-module
root = exports ? @

class root.Tools

	@trim: (string) ->
		string.replace /\s+/g, ''