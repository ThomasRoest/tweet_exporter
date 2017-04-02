module TweetExporter
  class HtmlBuilder
    def initialize(tweets)
      @tweets = tweets
      build_html
    end

    def build_html
     html = @tweets.map{|tweet| 
      "
      <div style='display:flex;align-items:flex-start'> \
       <img style='margin-right: 1em'src=#{tweet.profile_image_url}><p><b>#{tweet.username}</b> - <a href='https://twitter.com/i/web/status/#{tweet.id}'>#{tweet.id}</a></p>\
       <p style='flex: 1'>#{tweet.text} \
       <a href=#{tweet.urls[0][:expanded_url] unless tweet.urls.empty?}>#{tweet.urls[0][:expanded_url] unless tweet.urls.empty?}<a> \
       </p> \
      </div>\
      <hr style='border: 0;border-top: 1px solid #eee;margin: 20px 0 20px 0px;'>
      "
    }  

     # check for changing user avatar url? --> add placeholder    

     File.write("tweets/tweets#{rand(1..1000)}.html", html.join())  
    end
  end
end

