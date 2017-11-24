class UsersController < ApplicationController
  before_action :set_person, only: [:show, :edit, :destroy, :update]

  def index
    @user = User.order(:user_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html{ redirect_to users_url, notice: 'Пользователь #{@user.nickname} был успешно создан' }
      else
        format.html{ render action: 'new' }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html{ redirect_to users_url, notice: 'Данные пользователя #{@user.nickname} успешно обновлены' }
      else
        format.html{ render action: 'edit' }
      end
    end
  end

  def edit
  end

  def show
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html{ respond_to users_url, notice: 'Пользователь #{@user.nickname} успешно удален'}
    end
  end

private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :nickname)    
  end

  def set_person
    @user = User.find(params[:id])
  end
end
