class Post < ApplicationRecord
  include PostsHelper

  belongs_to :user
  validates :youtube_url, presence: true, format: { with: YOUTUBE_REGEX }

  after_create :notify_users
  before_create :get_infor_youtube_video

  jsonb_accessor(:data,
    url: :string
  )

  def notify_users
    Notification::NotificationBroadcastJob.perform_async(self.title, self.user.email)
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
