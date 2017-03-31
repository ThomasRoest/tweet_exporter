module TweetExporter
  class FilteredFavorite
    attr_accessor :id, :username, :text

    def initialize(args)
      @id = args[:id]
      @username = args[:username]
      @text = args[:text]
    end

    # http://stackoverflow.com/questions/3226054/how-to-convert-a-ruby-object-to-json
    
    def as_json(options = {})
        {
          id: @id,
          username: @username,
          text: @text
        }
    end

    def to_json(*options)
      as_json(*options).to_json(*options)
    end
  end
end



