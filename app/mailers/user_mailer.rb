class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_pledge(pledge)
    @pledge = pledge
    @project = @pledge.project
    @owner = @project.user
    @backer = @pledge.user
 

    mail(:to => @owner.email, :subject => "Your project received some backing on CrowdFunder.")
  end

end