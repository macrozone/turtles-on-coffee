module.exports = (app) ->
  # Index
  app.get '/', app.ApplicationController.index

  app.get "/random", app.ApplicationController.random

  app.get "/lindenmayer", app.ApplicationController.lindenmayer

  app.get "/about", app.ApplicationController.about

  # Error handling (No previous route found. Assuming it’s a 404)
  app.get '/*', (req, res) ->
    NotFound res

  NotFound = (res) ->
    res.render '404', status: 404, view: 'four-o-four'
