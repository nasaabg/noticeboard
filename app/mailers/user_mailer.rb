class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'
 
  def question_email(owner, questioner, question, product)
    @questioner = questioner
    @question  = question
    @product = product
    mail(to: owner, subject: 'Question from BOARD')
  end
end
