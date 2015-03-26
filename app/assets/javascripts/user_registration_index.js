$(document).on('ready page:load', function () {
    var baseUrl = 'http://localhost:3000/user_registration/';
    $("select[name='user[country_id]']").on('change', function () {
        var countryId = $(this).children(':selected').val();
        var citySelector = $("select[name='user[city]']")
        citySelector.removeAttr('disabled').empty();

        $.getJSON(baseUrl + 'cities/' + countryId, function(data){
            $.each(data, function(i, item){
                citySelector
                    .append($('<option>', { value : item })
                        .text(item));
            });
        });
    });
});