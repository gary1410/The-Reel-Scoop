$(document).ready(function(){

	$("#movies th a, #movies .pagination a").on("click", function(){
		$.getScript(this.href);
		return false;
	});

	$('#movies_search').on("submit", function(){
		$.get(this.action, $(this).seralize(), null, 'script')
		return false;
	})

	$("#movies_search input").keyup(function() {
		$.get($("#movie_search").attr("action"), $("#movies_search").serialize(), null, "script");
		return false;
	});


});

