#= require inc/jquery.js
#= require inc/jquery-ui-1.10.2.custom.min.js
#= require inc/bootstrap.min.js
#= require inc/canvasHelper.jquery.coffee



$ () ->
	$("#mainNav a[href='#{document.location.pathname}']").parent().addClass "active"
	

	# dragable windows
	$(".draggableWindow").offset left:900, top:110
	$(".draggableWindow").draggable().show()

	
	$(".draggableWindow").on "click", ->
		$(".draggableWindow").css "z-index", 1050
		$(@).css "z-index", 2000	


	$(".draggableWindow").each (index, item) ->
		$item = $ item
		

		$arrow = $("<img src='img/curved_arrow.png' />").css 
			position: "absolute"
			top: $item.offset().top-50
			left: $item.offset().left-180
			width: 162
		$("body").prepend $arrow

		
		$item.on "mouseover", -> $arrow.remove()
