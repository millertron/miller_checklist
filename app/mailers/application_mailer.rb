class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  default template_path: "mailers/#{self.name.underscore}"
  layout 'mailer'
end
