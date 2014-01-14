// var apikey = "vxwjzfe4gaczt2qpurr33cyj";

// construct the uri with our apikey
$(document).ready(function()   {
    var query = "";
    function getPage(){
        $("select").change(function() {
            var page_no = ""
            page_no = $( "select option:selected" ).val();
            alert(page_no);
            alert(query);
            var request = $.ajax({
                type: "GET",
                // url: moviesSearchUrl + '&q=' + encodeURI(search_query) + '&page_limit=' + page_limit + '&page=' +page, //sumbits it to the given url of the form
                url: 'search/query',
                data: {query:query, page:page_no}
            });
            request.done(function(data, textStatus, jqXHR) {
                document.getElementById('search-result').innerHTML = data;
                getPage();
            });
            return false;
        });       
    }
    $("#search").submit(function() {
        query = $(this).find('input').val();
        query = encodeURIComponent(query);

        alert(query);
        var request = $.ajax({
            type: "GET",
            // url: moviesSearchUrl + '&q=' + encodeURI(search_query) + '&page_limit=' + page_limit + '&page=' +page, //sumbits it to the given url of the form
            
            url: 'search/query',
            data: {query:query}
        });
        request.done(function(data, textStatus, jqXHR) {
            document.getElementById('init-block').innerHTML = "";
            document.getElementById('search-result').innerHTML = data;
            getPage();
            
        });
        return false;
    });
    
});