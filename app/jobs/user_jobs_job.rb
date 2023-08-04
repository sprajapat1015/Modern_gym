class UserJobsJob < ApplicationJob
  queue_as :default

  def perform(user)
    UserMailer.new_registration(user).deliver_now
  end
end
