require "sidekiq"
require "sidekiq/web"

Sidekiq.configure_client do |config|
  config.redis = {db: 2}
end

# now use the secret with a session cookie middleware
use Rack::Session::Cookie, secret: File.read(".session.key"), same_site: true, max_age: 86400

# run web ui
run Sidekiq::Web