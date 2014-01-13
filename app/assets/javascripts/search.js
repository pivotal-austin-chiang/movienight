// var apikey = "vxwjzfe4gaczt2qpurr33cyj";

// construct the uri with our apikey
$(document).ready(function()   {
    $("#search").submit(function() {
        var query = $(this).find('input').val();
        query = encodeURIComponent(query);
        var request = $.ajax({
            type: "GET",
            // url: moviesSearchUrl + '&q=' + encodeURI(search_query) + '&page_limit=' + page_limit + '&page=' +page, //sumbits it to the given url of the form
            
            url: 'search/query',
            data: {query:query}
        });
        request.done(function(data, textStatus, jqXHR) {
            $("#init-block").hide();
            document.getElementById('search-result').innerHTML = data;
        });
        return false;
    });
    $("#page").submit(function() {
        var page = $(this).find('input').val();
        var request = $.ajax({
            type: "GET",
            // url: moviesSearchUrl + '&q=' + encodeURI(search_query) + '&page_limit=' + page_limit + '&page=' +page, //sumbits it to the given url of the form
            url: 'search/query',
            data: {page:page_no}
        });
        request.done(function(data, textStatus, jqXHR) {
            document.getElementById('search-result').innerHTML = data;
        });
        return false;
    });
});