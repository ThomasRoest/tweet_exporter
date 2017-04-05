module TweetExporter
  class HtmlBuilder
    def initialize(tweets, count, username)
      @tweets = tweets
      @count = count
      @username = username
      build_html
    end

    def build_html
     html = @tweets.map{|tweet| 
      "
      <div style='display:flex;align-items:flex-start'> \
       <img style='margin-right: 1em'src=#{tweet.profile_image_url}> \
       <p style='flex: 1'> \
       <b>#{tweet.username}</b> \
        #{tweet.text} \
         <a href=#{tweet.urls[0][:expanded_url] unless tweet.urls.empty?}>#{tweet.urls[0][:expanded_url] unless tweet.urls.empty?}<a> \
       </p> \
       <a href='https://twitter.com/i/web/status/#{tweet.id}' style='color:grey;'>#{tweet.id}</a>\ 
      </div>\
      <hr style='border: 0;border-top: 1px solid #eee;margin: 20px 0 20px 0px;'>
      "
    }  
    
    unless File.directory?('tweets') 
      Dir.mkdir 'tweets'
    end
    File.write("tweets/tweets_batch_#{@count}_#{@username}.html", html.join())  
    end
  end
end
