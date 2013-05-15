#= require inc/jquery.js
#= require inc/jquery-ui-1.10.2.custom.min.js
#= require inc/bootstrap.min.js
#= require inc/canvasHelper.jquery.coffee



$ () ->
	$("#mainNav a[href='#{document.location.pathname}']").parent().addClass "active"
	

	# dragable windows
	
	$(".draggableWindow").draggable()
	$(".draggableWindow").on "click", ->
		$(".draggableWindow").css "z-index", 1050
		$(@).css "z-index", 2000	
