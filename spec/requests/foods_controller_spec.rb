require 'rails_helper'

RSpec.describe 'FoodsControllers', type: :request do

  before(:each) do
    @user = User.create!(name: 'Amre5', email: 'em@blog.com', password: '12345678')
    @food = Food.new(name: "shiro", measurement_unit: "unit", price: 1, quantity: 3)
    # @user.save
    sign_in @user
    get '/users/1/foods'
  end

  describe 'GET users/:id/index' do
    it 'The server with /users/:id/foods request should respond status number 200' do
      expect(response).to have_http_status(200)
    end
    it "should render 'foods index' template" do
      expect(response).to render_template('index')
    end
    it 'should include the Add Food text' do
      expect(response.body).to include('Add Food')
    end

  end
end
