module.exports = (app) ->
  class app.ApplicationController

    # GET /
    @index = (req, res) ->
      res.render 'index',
        view: 'index'

    @random = (req, res) ->
    	res.render 'random', view: 'random'
