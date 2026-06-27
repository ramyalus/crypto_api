Sidekiq.configure_server do |config|

  schedule = YAML.load_file(
    Rails.root.join("config/schedule.yml")
  )

  Sidekiq::Cron::Job.load_from_hash(schedule)

end