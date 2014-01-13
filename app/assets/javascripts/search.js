var apikey = "vxwjzfe4gaczt2qpurr33cyj";
var baseUrl = "http://api.rottentomatoes.com/api/public/v1.0";
var page = 1;
var page_limit = 15;

// construct the uri with our apikey
var moviesSearchUrl = baseUrl + '/movies.json?apikey=' + apikey;
$("form.search-form").submit(function() {
    var search_query = $(this).serialize();
    $.ajax({
        // type: "GET",
        // url: moviesSearchUrl + '&q=' + encodeURI(search_query) + '&page_limit=' + page_limit + '&page=' +page, //sumbits it to the given url of the form
        
        url: 'search/movieList'
        data: {search_query, page_no}}).done(function(data){

        });
});
