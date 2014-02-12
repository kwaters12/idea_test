class DiscussionMailer < ActionMailer::Base
  default from: "gpgkelly@gmail.com"

  def notify_owner discussion
    @discussion = discussion
    @sending_user = discussion.user
    @idea = discussion.idea
    @receiving_user = @discussion.user
    mail(to: @receiving_user.email, subject: "You have received a comment on #{@idea.title}" )
  end

end
