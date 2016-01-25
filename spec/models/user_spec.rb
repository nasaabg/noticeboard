require "rails_helper"

describe User do
  let(:user) { User.create!(email: "tester@tets.pl", password: "123456789", password_confirmation: "123456789", confirmed_at: Date.today) }
  let(:admin) { User.create!(email: "tester1@tets.pl", password: "123456789", password_confirmation: "123456789", confirmed_at: Date.today, admin: true) }
  let(:banned) { User.create!(email: "ban@tets.pl", password: "123456789", password_confirmation: "123456789", confirmed_at: Date.today, baned: true) }
  let(:moderator) { User.create!(email: "moderator@tets.pl", password: "123456789", password_confirmation: "123456789", confirmed_at: Date.today, moderator: true) }
  
  it "has correct email" do
    expect(user.email).to eq("tester@tets.pl")
  end

  it "has correct admin status" do
    expect(user.admin).to eq(false)
  end

  it "has correct admin status" do
    expect(admin.admin).to eq(true)
  end

  it "has correct ban status" do
    expect(user.baned).to eq(false)
  end

  it "has correct ban status" do
    expect(banned.baned).to eq(true)
  end

  it "has correct moderator status" do
    expect(moderator.moderator).to eq(true)
  end

  it "has correct admin status" do
    expect(user.moderator).to eq(false)
  end

  describe "#received_points" do
    let(:rewarder) { create(:user) }

    it "has some received points" do
      Point.create(receiver: user, rewarder: rewarder)
      user.save
      expect(user.received_points.size).to eq(1)     
    end
  end

  describe "#given_points" do
    let(:receiver1) { create(:user) }
    let(:receiver2) { create(:user) }

    it "has some received points" do
      Point.create(receiver: receiver1, rewarder: user)
      Point.create(receiver: receiver2, rewarder: user)
      user.save
      expect(user.given_points.size).to eq(2)     
    end
  end
end