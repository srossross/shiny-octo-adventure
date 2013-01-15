require('lib/setup')

Spine = require('spine')


class App extends Spine.Controller

  # This is Spine shorthand for binding events to methods
  events: 
    'click button.fetch_data': 'fetch_the_data' 

  #This adds the html element '#the_canvas' as an attribute of this class.
  elements: 
    '#the_canvas': 'the_canvas'
  
  constructor: ->
    super

    #Constants
    @server_name = "http://localhost:5000"
    @fillStyle = 'rgba(166, 191, 221, .1)'

    canvas = document.getElementById 'the_canvas'

    # This sets the number of 'pixels?' in eaach direction.
    # without this the image looks skewed
    canvas.width = 400;
    canvas.height = 400;
    @context = canvas.getContext '2d'

  
  fetch_the_data: (e) ->
    # The button has been clicked, lets do somthing
    @log 'fetching the data', e.type

    server_name = @server_name
    jQuery.ajax
      url: "#{server_name}/data.json"
      crossDomain: true
      data: {echo_me: 'echo echo ...'}
      success: @got_the_data
      error: (hdr) => alert('There was an error with your request')

  got_the_data: (data) =>
    'Called when the ajax response succeeds'
    
    @log 'Got the data', data, @the_canvas.width(), @the_canvas.height()

    @f_count=0
    @nparticles = data.nparticles or 12
    
    @context.strokeText("Hello World", 10, 50);
    @base = @start = new Date()
    @animate()

  animate: () =>
    '''
    Animate called for every key frame
    '''
    window.requestAnimationFrame @animate
    @render()
    
  render: () ->
    '''
    Handles all of the drawing
    '''
    canvas = document.getElementById 'the_canvas'
    width = canvas.width
    height = canvas.height

    curr = (@start - @base) / 1000
    @start = new Date()
    next = (@start - @base) / 1000
    
    @fade()

    particle_sep = width / (2*@nparticles)

    for particle in [1..@nparticles]
      @context.beginPath()
      radius = particle * particle_sep
      speed = (1 + @nparticles - particle) / @nparticles
      @context.arc(width/2,height/2, radius, curr*speed, next*speed)
      @context.stroke()


  fade: ->
    '''
    Fade what is drawn into the background color. 
    For this technique to work
    '''

    @f_count += 1

    if @f_count >= 4
      @f_count = 0
      
      canvas = document.getElementById 'the_canvas'
      width = canvas.width
      height = canvas.height

      @context.globalCompositeOperation = 'source-atop'

      # Transparent ocean color 
      @context.fillStyle = @fillStyle
      @context.fillRect(0, 0, width, height)

      #Reset coposite op
      @context.globalCompositeOperation = 'source-over'


module.exports = App
