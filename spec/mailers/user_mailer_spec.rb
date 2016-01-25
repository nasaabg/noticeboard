require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "question_email" do
    let(:owner) { create(:user) }
    let(:questioner) { create(:user) }
    let(:question) { "My question" }
    let(:product) { create(:product) }
    let(:email) { UserMailer.question_email(owner.email, questioner.email, question, product ) }

    it 'renders the subject' do
      expect(email.subject).to eql('Question from BOARD')
    end

    it 'renders the receiver email' do
      expect(email.to).to eql([owner.email])
    end

    it 'renders the sender email' do
      expect(email.from).to eql(['notifications@example.com'])
    end

    it 'assigns @question' do
      expect(email.body.encoded).to match(question)
    end

    it 'assigns @product' do
      expect(email.body.encoded).to match(product.name)
    end
    it 'assigns @questioner' do
      expect(email.body.encoded).to match(questioner.email)
    end
  end
end
