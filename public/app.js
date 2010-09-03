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

// Google analytics:
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-18340745-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

