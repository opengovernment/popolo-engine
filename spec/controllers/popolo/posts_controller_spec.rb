require 'spec_helper'

describe Popolo::PostsController do
  before :each do
    @routes = Popolo::Engine.routes
    @post = FactoryGirl.create :post
  end

  describe 'GET index' do
    it 'assigns all posts as @posts' do
      get :index
      assigns(:posts).to_a.should == [@post]
    end
  end

  describe 'GET show' do
    it 'assigns the requested post as @post' do
      get :show, id: @post.id.to_s
      assigns(:post).should == @post
    end

    it 'gets the requested post by slug' do
      get :show, id: @post.slug
      assigns(:post).should == @post
    end
  end
end