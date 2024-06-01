class Notification::NotificationBroadcastJob
  include Sidekiq::Worker

  def perform title, email
    ActionCable.server.broadcast("notifications_channel", {
      title: title,
      author: email
    })
  end
end
