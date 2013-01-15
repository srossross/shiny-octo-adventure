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
    @log 'fetching the data', e.type

    jQuery.ajax
      url: 'http://localhost:5000/data.json'
      crossDomain: true
      success: @got_the_data
      error: (hdr) => alert('There was an error with your request')

  got_the_data: (data) =>
    'Called when the ajax response succeeds'
    @log 'Got the data', data


module.exports = App
