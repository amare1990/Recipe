require 'rails_helper'

RSpec.describe 'RecipesControllers', type: :request do

  describe 'GET #index' do
    before(:each) do
      @user = User.create!(name: 'Amre5', email: 'em@blog.com', password: '12345678')
      @recipe = Recipe.new(name: "shiro aserar", preparation_time: 0.25, cooking_time: 1,
      description: "shiro, salt, pepper, onion, potato", public: true, user_id: @user.id)
      # @user.save
      sign_in @user
      get '/users/1/recipes'
    end

    it 'The server with /users/:id/recipes request should respond status number 200' do
      expect(response).to have_http_status(200)
    end
    it "should render 'recipes index' template" do
      expect(response).to render_template('index')
    end
    it 'should include the Recipes text' do
      expect(response.body).to include('Recipes')
    end
  end

  describe 'GET #show' do
    before(:each) do
      @user = User.create!(name: 'Amre5', email: 'em@blog.com', password: '12345678')
      @recipe = Recipe.create(name: "shiro aserar", preparation_time: 0.25, cooking_time: 1,
      description: "shiro, salt, pepper, onion, potato", public: true, user_id: @user.id)
      # @user.save
      sign_in @user
      get "/users/#{@user.id}/recipes/#{@recipe.id}"
    end
    it 'The server with /users/:id/recipes/:id request should respond status number 200' do
      expect(response).to have_http_status(200)
    end
    it "should render 'recipes index' template" do
      expect(response).to render_template('show')
    end
    it 'should include the Recipes text' do
      expect(response.body).to include(@recipe.name)
    end
  end
end
