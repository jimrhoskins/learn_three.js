require 'coffee-script'
express = require 'express'

app = express.createServer()

app.configure ->
  app.set 'view engine', 'jade'
  app.set 'views', "#{__dirname}/views"

  app.use express.compiler
    src: "#{__dirname}/examples"
    enable: ['coffeescript']
  app.use app.router
  app.use express.static("#{__dirname}/examples")

app.get '/example/:name', (req, res) ->
  res.render 'example'
    name: req.params.name
    layout: false

app.listen(process.env.PORT ? 3000)
