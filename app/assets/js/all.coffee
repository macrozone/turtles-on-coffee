#= require inc/jquery.js
#= require inc/jquery-ui-1.10.2.custom.min.js
#= require inc/bootstrap.min.js
#= require inc/canvasHelper.jquery.coffee


resizeCanvasWithWindow = ($canvas) ->
		width = $(document).width()
		height = $(document).height()
		$canvas.canvasHelper "width", width
		$canvas.canvasHelper "height", height

setupBackGroundCanvas= () ->
	$backgroundCanvas = $("<canvas />").attr "id", "background"
	quality = 2
	$backgroundCanvas.canvasHelper(quality: quality)
	$backgroundCanvas.css position: "absolute", top: 0, left: 0, "z-index": -10
	$backgroundCanvas.appendTo $ "body"
	resizeCanvasWithWindow($backgroundCanvas)
	$(window).resize ->
		resizeCanvasWithWindow $backgroundCanvas
	return $backgroundCanvas


$ () ->
	$("#mainNav a[href='#{document.location.pathname}']").parent().addClass "active"
	#init background
	$backgroundCanvas = setupBackGroundCanvas()

	$(".clearBackgroundButton").on "click", ->
		$backgroundCanvas.canvasHelper "clear"
		false

	# dragable windows
	
	$(".draggableWindow").draggable()
	$(".draggableWindow").on "click", ->
		$(".draggableWindow").css "z-index", 1050
		$(@).css "z-index", 2000	
