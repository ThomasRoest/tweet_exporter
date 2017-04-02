module TweetExporter
  class FilteredFavorite
    attr_accessor :id, :username, :text, :urls, :profile_image_url

    def initialize(args)
      @id = args[:id]
      @username = args[:username]
      @text = args[:text]
      @urls = args[:urls]
      @profile_image_url = args[:profile_image_url]
    end
  end
end



