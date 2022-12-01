require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class OurWorker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when "super_hard"
      sleep 10
      p "This is a super_hard tasks that takes a long time."
    when "hard"
      sleep 5
      p "This is a hard task that takes a bit of time."
    else
      sleep 1
      p "This task is easy and took almost no time."
    end
  end
end