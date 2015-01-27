// Helper function to call the API using json-p
// examples:
// call_api("me", {}, console.log)
// call_api("projects", {}, console.log)
// call_api("projects", { per_page: 10 }, console.log)
function call_api(endpoint, params, callback) {
  params['access_token'] = $('#redboothAuth').data('token')
  $.ajax({
    url: "https://redbooth.com/api/3/" + endpoint,
    data: params,
    jsonp: "callback",
    dataType: "jsonp",
    success: function(response) {
      callback(response);
    }
  });
}
