class UsersController < ApplicationController

  def show
    user = User.find(params[:id])
    @name = user.name
    @declarations = user.declarations
  end

end