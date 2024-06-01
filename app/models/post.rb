class Post < ApplicationRecord
  include PostsHelper

  belongs_to :user
  validates :youtube_url, presence: true, format: { with: YOUTUBE_REGEX, message: "Invalid Youtube url" }

  after_create :notify_users
  before_create :get_infor_youtube_video

  jsonb_accessor(:data,
    url: :string
  )

  def notify_users
    ActionCable.server.broadcast("notifications_channel", {
      title: self.title,
      author: self.user.email
    })
  end

  def get_infor_youtube_video
    response = Youtube::VideoService.new(self.youtube_url).get_infor_video
    if response.code == "200"
      body = JSON.parse(response.body)
      self.data = body
      self.title = body.dig("title")
    end
  end

  def get_frame
    get_youtube_iframe(video_url, self.title)
  end

  def video_url
    self.url.presence || self.youtube_url
  end
end
