class UsersController < Clearance::UsersController
  def edit
    user
  end

  def update
    user.update_attributes(user_params)
    user.save!
    redirect_to root_path
  end

  def validate(record)

  end

  private

  def user
    @user||=User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
