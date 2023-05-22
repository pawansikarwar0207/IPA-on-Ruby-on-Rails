class Admin::UsersController < ApplicationController
  layout 'admin'

  before_action :authenticate_user!

  def index
    @users = User.all
  end

  end
