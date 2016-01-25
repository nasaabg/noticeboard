class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def question_email(owner_email, questioner_email, question, product)
    @questioner_email = questioner_email
    @question  = question
    @product = product
    mail(to: owner_email, subject: 'Question from BOARD')
  end
end
