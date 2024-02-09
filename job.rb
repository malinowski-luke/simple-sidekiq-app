require "sidekiq"
require "sidekiq/api"

Sidekiq.configure_client do |config|
  config.redis = {db: 2}
end

Sidekiq.configure_server do |config|
  config.redis = {db: 2}
end


class BaseJob
  include Sidekiq::Job
end


class HelloWorldJob < BaseJob
  def perform(job_hard=false)
    sleep_time = job_hard ? 30 : 10
    sleep sleep_time
    puts "Hello world"
  end
end

class FailedJob < BaseJob
  sidekiq_options retry: 0

  def perform
    sleep 5 
    raise "This job will always fail!"
  end
end