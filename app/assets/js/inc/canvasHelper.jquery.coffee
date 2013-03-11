$ = jQuery
pluginName = "canvasHelper"

methods = 
  init: (options) ->
    settings = $.extend quality: 1, options
    $this = $ this
    $this.data pluginName, settings

  width: (width) ->
    $this = $ this
    {quality: quality} = $this.data pluginName
    $this.attr "width", width * quality
    $this.width width

  height: (height) ->
    $this = $ this
    {quality: quality} = $this.data pluginName
    console.log quality
    $this.attr "height", height * quality
    $this.height height
  
  quality: () ->
    $this = $ this
    {quality: quality} = $this.data pluginName
    quality
  
  clear: ()->
    $this = $ this
    canvas = $this.get 0
    # this resets the canvas  
    canvas.width = canvas.width
 
$.fn.canvasHelper = (method) ->
  # Method calling logic
  if methods[method]
    return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ))
  else if ( typeof method == 'object' || ! method ) 
    return methods.init.apply( this, arguments )
  else
    $.error( 'Method ' +  method + ' does not exist on '+pluginName+'.tooltip' )
