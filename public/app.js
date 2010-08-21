$(function() {
  //$('.date').hover(... show menu
});

function showtweets(data) {
  $(function() {
    var twitter_story = document.createElement('div');
    twitter_story.className = 'story twitter';
    var number_of_results = data.results.length;
    for(var i = 0; i < number_of_results; i++) {
      var tweet = data.results[i];
      var message = document.createElement('p');
      var link = document.createElement('a');
      link.href = 'http://twitter.com/' + tweet.from_user + "/status/" + tweet.id;
      link.appendChild(document.createTextNode(tweet.text));
      message.appendChild(link);
      twitter_story.appendChild(message);
    }
    $(".right.column").append(twitter_story);
  });
}
