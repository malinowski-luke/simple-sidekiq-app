## What

A simple non-rails Sidekiq implementation

## Run

1. Install dependencies 

```sh
bundle install
```

2. Run Sidekiq

```bash
bundle exec sidekiq -r ./job.rb
```

3. Enter irb console

```bash
bundle exec irb -r ./job.rb

# This works can be set up with pry
bin/console
```

4. Run Job

```rb
MyJob.perform_async("Hello world")
```

5. Run Sidekiq Web UI

defaults to [locahost:9292](http://localhost:9292)

```bash
rackup
```

## Gotcha to run WebUI

Run in `bin/console`

```rb
require "securerandom"

File.open(".session.key", "w") do |f|
  f.write(SecureRandom.hex(32))
end
```
