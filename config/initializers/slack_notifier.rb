# config/initializers/slack_notifier.rb

require 'slack-notifier'

$slack_client = Slack::Notifier.new "https://hooks.slack.com/services/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"
