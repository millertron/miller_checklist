class ApplicationMailer < ActionMailer::Base
  default from: ENV["DEFAULT_FROM"] || "from@example.com"
  layout 'mailer'
end
