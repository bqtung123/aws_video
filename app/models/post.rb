class Post < ApplicationRecord
  after_create :notify_users

  def notify_users
    ActionCable.server.broadcast("notifications_channel", {
      title: self.title
    })
  end
end
