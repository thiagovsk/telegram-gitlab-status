require 'telegram/bot'
require_relative 'gitlab'
require_relative 'config'

include Configuration

token = BOT_TOKEN

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/help'
      bot.api.send_message(chat_id: message.chat.id, text: "Welcome to Gitlab status bot")
    when '/issues'
      bot.api.send_message(chat_id: message.chat.id, text: "Your issues")
    when '/issues-open'
      bot.api.send_message(chat_id: message.chat.id, text: "Your open issues")
    when '/projects'
      bot.api.send_message(chat_id: message.chat.id, text: Gitlab.group_projects)
    end
  end
end

