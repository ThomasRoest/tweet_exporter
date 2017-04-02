module TweetExporter
  class FilteredFavorite
    attr_accessor :id, :username, :text, :urls

    def initialize(args)
      @id = args[:id]
      @username = args[:username]
      @text = args[:text]
      @urls = args[:urls]
    end
  end
end



