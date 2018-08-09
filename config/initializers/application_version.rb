if Rails.env.development?
  # Update .app-version with latest git tag:
  File.open('.app-version', 'w') do |file|
    file.write `git describe --tags --always`
  end
end

Rails.application.config.version = File.read '.app-version'
