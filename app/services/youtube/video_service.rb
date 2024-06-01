require 'net/http'

module Youtube
  class VideoService
    attr_accessor :youtube_url

    def initialize(youtube_url)
      @youtube_url = youtube_url
    end

    def get_infor_video
      uri = URI("#{base_url}?dataType=json&url=#{youtube_url}")
      res = Net::HTTP.get_response(uri)
    end

    private

    def base_url
      "https://noembed.com/embed"
    end
  end
end
