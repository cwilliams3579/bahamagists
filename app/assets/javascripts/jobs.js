$(document).on("page:change", function() {
  var jobs = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: "/jobs/autocomplete?query=%QUERY",
      wildcard: "%QUERY"
    }
  });
  $("#jobs_search").typeahead(null, {
    source: jobs
  });
});
