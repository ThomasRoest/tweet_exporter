module TweetExporter
  class HtmlBuilder
    def initialize(tweets)
      @tweets = tweets
      build_html
    end

    def build_html
     html = @tweets.map{|tweet| 
      "<p><b>#{tweet.username}</b> - <a href='https://twitter.com/i/web/status/#{tweet.id}'>#{tweet.id}</a></p>\
       <p>#{tweet.text}</p> \
       <p><a href=#{tweet.urls[0][:expanded_url] unless tweet.urls.empty?}>#{tweet.urls[0][:expanded_url] unless tweet.urls.empty?}<a></p>
       <hr>
       "
    }      

     File.write("tweets/tweets#{rand(1..1000)}.html", html.join())  
    end
  end
end
