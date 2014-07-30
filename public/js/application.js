$(document).ready(function() {
	$('#derp_form').on('submit', function(event){
		event.preventDefault();
		var text = $(this).serialize();

		$.post('/', text, function(response){
			$('#derps').append(response);
			$('#derp_form textarea').val('');
		}, 'html');
	});

	$('.container').on('submit', '#logout_form', function(event){
		event.preventDefault();

		$.post('/logout', function(response){
			$('#logout').remove();
			$('.container > h1').after(response);
		});
	});

	$('.container').on('submit', '#signup', function(event){
		event.preventDefault();
		var user_info = $(this).serialize();

		$.post('/signup', user_info, function(response){
			$('#user_forms').remove();
			$('.container > h1').after(response);
		}, 'html');
	});

	$('.container').on('submit', '#login', function(event){
		event.preventDefault();
		var user_info = $(this).serialize();

		$.post('/login', user_info, function(response){
			$('#user_forms').remove();
			$('.container > h1').after(response);
		}, 'html');
	});
});
