require 'rails_helper'

RSpec.describe 'UsersControllers', type: :request do
  describe 'GET users#index' do
    before(:each) do
      @user = User.create!(name: 'Amre5', email: 'em@blog.com', password: '12345678')

      # @user.save
      sign_in @user
      get '/users'
    end

    it 'The server with /users request should respond status number 200' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end

    it 'should include the Users text' do
      expect(response.body).to include('<h1>Users</h1>')
    end
  end
  describe 'GET users#show' do
    before(:each) do
      @user = User.new(name: 'amie', email: 'amie@gmail.com', password: '7654321')

      @user.save
      sign_in @user
      get "/users/#{@user.id}"
    end
    it 'should respond with a success' do
      expect(response).to have_http_status(200)
    end

    it 'should include the username text' do
      expect(response.body).to include('amie')
    end
  end
end
