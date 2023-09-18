require "rails_helper"

RSpec.describe Rating, type: :model do
  describe "When an instances has wrong arguments" do
    before(:each) do
      @rating = Rating.new(
        rate: 4,
        comment: "good",
        bottle_id: Bottle.last.id,
        user_id: User.last.id
      )
    end

    it "should not be valid without a rate" do
      @rating.rate = ""
      expect(@rating).to_not be_valid
    end
    it "should not be valid with a negative rate" do
      @rating.rate = -1
      expect(@rating).to_not be_valid
    end
    it "should not be valid with above 5 rate" do
      @rating.rate = 8
      expect(@rating).to_not be_valid
    end
    it "should not be valid without a bottle" do
      @rating.bottle_id = ""
      expect(@rating).to_not be_valid
    end
    it "should not be valid without a user" do
      @rating.user_id = ""
      expect(@rating).to_not be_valid
    end
  end

  describe "When an instances has wrong arguments" do
    before(:each) do
      @rating = Rating.new(
        rate: 4,
        comment: "good",
        bottle_id: Bottle.last.id,
        user_id: User.last.id
      )
      @rating_count = Rating.count
    end
    it "should be valid" do
      expect(@rating).to be_valid
    end
    it "should add one instance" do
      @rating.save
      expect(Rating.count).to eq (@rating_count + 1)
    end
  end
end
