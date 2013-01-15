require('lib/setup')

Spine = require('spine')

class App extends Spine.Controller

  # This is Spine shorthand for binding events to methods

  events: 
    'click button.fetch_data': 'fetch_the_data' 

  constructor: ->
    super

  fetch_the_data: (e) ->
    # The button has been clicked, lets do somthing
    @log 'fetching_the_data', e.type


module.exports = App
