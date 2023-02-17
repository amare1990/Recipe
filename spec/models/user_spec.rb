require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user1 = User.new(name: 'debie', email: 'deb3@test.com', password: '1234567')
  end

  # before(@user1.save)

  describe " model validation \n" do
    it "should not be valid if the user has no name\n" do
      @user1.name = nil
      expect(@user1).to_not be_valid
    end
    it "should not be valid if user doesn't have an email\n" do
      @user1.email = nil
      expect(@user1).to_not be_valid
    end
    it "should not be valid if user doesn't have an password\n" do
      @user1.password = nil
      expect(@user1).to_not be_valid
    end
  end
end
