## What

A simple non-rails sidekiq implmantation

## Run

1. Run Sidekiq

```bash
bundle exec sidekiq -r ./job.rb
```

2. Enter irb console

```bash
bundle exec irb -r ./job.rb
```

3. Run Job

```rb
MyJob.perform_async("Hello world")
```

## Gotcha to run WebUI

Run in irb console

```rb
require "securerandom"

File.open(".session.key", "w") do |f|
  f.write(SecureRandom.hex(32))
end
```
