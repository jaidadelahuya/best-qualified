function addError(msgD, msg) {
	msgD.removeClass("bq-alert-success");
	msgD.removeClass("bq-alert-warning");
	msgD.addClass("bq-alert bq-alert-danger");
	msgD.html(msg);
}

function addWarning(msgD, msg) {
	msgD.removeClass("bq-alert-success");
	msgD.removeClass("bq-alert-danger");
	msgD.addClass("bq-alert bq-alert-warning");
	msgD.html(msg);
}

function addSuccess(msgD, msg) {
	msgD.removeClass("bq-alert-danger");
	msgD.removeClass("bq-alert-warning");
	msgD.addClass("bq-alert bq-alert-success");
	msgD.html(msg);
}

function addPopOver() {

	$('#imginfo').webuiPopover({
		placement : 'auto',
		width : '13em',
		height : '8em',
		trigger : 'click',
		arrow : true,
		content : $('#popover-content').html(),
		closeable : false,
		padding : false,
		type : 'html'
	});
}



$(document).ready(function() {
	$('[data-toggle="tooltip"]').tooltip(); 
	$(".filter-header")
	.click(
			function() {

				var par = $(this).closest(
						".filter-component");
				par.find(".filter-values")
						.slideToggle();
				$(this)
						.find(".filter-arrow")
						.toggleClass(
								"glyphicon glyphicon-chevron-down glyphicon glyphicon-chevron-up");
			});
	
	
	
	
	$("#discussion-trig").click(function() {
		$(".article-div").hide();
		$(".discussion-div").slideDown("slow");
	});
	$("#close-discussion").click(function() {
		$(".discussion-div").slideUp("slow");
	});
	
	$("#article-trig").click(function() {
		$(".discussion-div").hide();
		$(".article-div").slideDown("slow");
	});
	$("#close-article").click(function() {
		$(".article-div").slideUp("slow");
	});
	
	$("#imginfo").mouseenter(function() {
		addPopOver();
	});
	
	$("#add-mailing-list").click(function() {
		$("#mailing-list-div").waitMe({
			effect : 'bounce',
			color : '#013143',
			sizeW : '10',
			sizeH : '10'
		});
		
		$.ajax({
			url:"/bq/open/handler/newsletter-subscribe",
			data: $("#newsletter-subscribe-form").serialize(),
			success: function(data) {
				addSuccess($("#mailing-list-msg-div"), "You have been subscribed to our newsletter.");
			},
			error: function(xhr,status,errorThrown) {
				addError($("#mailing-list-msg-div"), "We could no subscribe you at this time, Please try again.");
			},
			complete : function() {
				$("#mailing-list-div").waitMe('hide');
			}
		});
	});
	
});