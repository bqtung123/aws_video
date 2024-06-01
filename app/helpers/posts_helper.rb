module PostsHelper
  YOUTUBE_REGEX = %r(\A(http[s]*:\/\/)?(www.)?(youtube.com|youtu.be)\/(watch\?v=){0,1}([a-zA-Z0-9_-]{11}))

  def find_youtube_id url
    matches = YOUTUBE_REGEX.match url.to_str
    if matches
      matches[6] || matches[5]
    end
  end

  def get_youtube_iframe url, title, width = "560px", height = "315px"
    youtube_id = find_youtube_id url

    result = %(<iframe title=#{title} width="#{width}"
                height="#{height}" src="//www.youtube.com/embed/#{ youtube_id }"
                frameborder="0" allowfullscreen></iframe>)
    result.html_safe
  end
end
