module.exports = (app) ->
  class app.ApplicationController

    # GET /
    @index = (req, res) ->
      res.render 'index'

    @random = (req, res) ->
    	res.render 'random'

    @lindenmayer = (req, res) ->
    	res.render 'lindenmayer'

   	@about = (req, res) ->
   		res.render 'about'
   		
