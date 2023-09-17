require "rails_helper"

RSpec.describe Bottle, type: :model do
  describe "When an instances has wrong arguments" do
    before(:each) do
      @bottle = Bottle.new(
        name: "Bottle1",
        wine_type: "red",
        property: "Property1",
        year: 2021
      )
    end
    it "should not be valid without a name" do
      @bottle.name = ""
      expect(@bottle).to_not be_valid
    end
    it "should not be valid without a wine_type" do
      @bottle.wine_type = ""
      expect(@bottle).to_not be_valid
    end
    it "should not be valid with incorrect wine_type" do
      @bottle.wine_type = "blue"
      expect(@bottle).to_not be_valid
    end
    it "should not be valid without a property" do
      @bottle.property = ""
      expect(@bottle).to_not be_valid
    end
    it "should not be valid without year" do
      @bottle.year = ""
      expect(@bottle).to_not be_valid
    end
    it "should not be valid with future year" do
      @bottle.year = Date.today.year + 2
      expect(@bottle).to_not be_valid
    end
    it "should not be valid if the bottle already exist"do
      @bottle.name = Bottle.last.name
      @bottle.year = Bottle.last.year
      expect(@bottle).to_not be_valid
    end
  end

  describe "When an instances has wrong arguments" do
    before(:each) do
      @bottle = Bottle.new(
        name: "Bottle1",
        wine_type: "red",
        property: "Property1",
        year: 2021
      )
      @bottle_count = Bottle.count
    end
    it "should be valid" do
      expect(@bottle).to be_valid
    end
    it "should add one instance" do
      @bottle.save
      expect(Bottle.count).to eq (@bottle_count + 1)
    end
  end

  describe "When call average_rate" do
    before(:each) do
      @bottle = Bottle.create(
        name: "Bottle1",
        wine_type: "red",
        property: "Property1",
        year: 2021
      )
    end
    it "should be empty if no ratings" do
      expect(@bottle.average_rate).to be_empty
    end
    it "should return the average" do
      Rating.create(rate: 2, comment: 'comment', bottle_id: @bottle.id, user_id: User.last.id)
      Rating.create(rate: 3, comment: 'comment', bottle_id: @bottle.id, user_id: User.last.id)
      Rating.create(rate: 3, comment: 'comment', bottle_id: @bottle.id, user_id: User.last.id)
      expect(@bottle.average_rate.round(2).to_i).to eq ((2+2+3)/3).round(2)
    end
  end
end
