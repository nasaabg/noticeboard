require 'rails_helper'

RSpec.describe Point, type: :model do
  let(:receiver) { create(:user) }
  let(:rewarder) { create(:user) }

  describe "#receiver" do
    let(:point) { Point.create(receiver: receiver, rewarder: rewarder) }
    it "returns point receiver" do
      expect(point.receiver).to eq(receiver)
    end
  end


  describe "#rewarder" do
    let(:point) { Point.create(receiver: receiver, rewarder: rewarder) }
    it "returns point rewarder" do
      expect(point.rewarder).to eq(rewarder)
    end
  end

  describe "validators" do
    it "raise error when receiver not given" do
      creation = lambda { Point.create!(receiver: nil, rewarder: rewarder) }
      expect { creation.call}.to raise_error(ActiveRecord::RecordInvalid)
    end

     it "raise error when rewarder not given" do
      creation = lambda { Point.create!(receiver: receiver, rewarder: nil) }
      expect { creation.call}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
