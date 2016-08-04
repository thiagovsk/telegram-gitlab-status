require 'yaml'
module Configuration
  constants = YAML.load_file('config.yml')
  GITLAB_PRIVATE_TOKEN = constants["gitlab_private_token"]
  BOT_TOKEN = constants["bot_token"]
end
