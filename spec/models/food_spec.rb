require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    subject { Food.new(name: 'Beyaynet', measurement_unit: 'unit', price: 100.5, quantity: 2) }
  end

  before { subject.save }

  describe " model presence validations : \n" do
    it "\nname attribute value should be present" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "\nname attribute value should be exactly 'Beyaynet' " do
      expect(subject.name) == 'Beyaynet'
    end

    it "\nMeasurement_unit attribute value should be present" do
      subject.measurement_unit = nil
      expect(subject).to_not be_valid
    end

    it "\nprice attribute value should be present" do
      subject.price = nil
      expect(subject).to_not be_valid
    end

    it "\nquantity attribute value should be present" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "\n price should not be a string" do
      subject.price = '2 birr'
      expect(subject).to_not be_valid
    end

    it "\n quantity should not be a string" do
      subject.price = ' 2 units'
      expect(subject).to_not be_valid
    end
  end

  describe "model numerical validations: \n" do
    it "\n The price should not be zero" do
      subject.price = 0
      expect(subject).not_to be_valid
    end
    it "\n The price should not be -ve number" do
      subject.price = -1.5
      expect(subject).not_to be_valid
    end
    it "\n The quantity should not be zero" do
      subject.quantity = 0
      expect(subject).not_to be_valid
    end
    it "\n The quantity should not be -ve number" do
      subject.quantity = -4.5
      expect(subject).not_to be_valid
    end
  end
end
