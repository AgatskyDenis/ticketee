class Notifier < ActionMailer::Base
  default :from => "agatsky.dn@gmail.com"

def comment_updated(comment, user)
  @comment = comment
  @user = user
  mail(:to => user.email,
       :from => "agatsky.dn@gmail.com",
       :subject => "[ticketee] #{comment.ticket.project.name} - #{comment.ticket.title}")
end
end

