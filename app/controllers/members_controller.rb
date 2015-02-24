class MembersController < ApplicationController
  before_filter do
    redirect_to root_path unless current_admin
  end

  def index
    @member = Member.all
  end

  def new
    @member = Member.new
    @role = ["Coach", "Advocate", "Player", "Referee"]
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      # user_email = params['member']['email']
      # if !user_email.nil?
        # @user = User.find_by_email(user_email)
        # if @user
        #  @user.member_id = @member.id
        #  @user.update(email: user_email)
      #  end
      # end
      flash[:success] = "Member successfully created!"
      redirect_to @member
    else
      flash[:danger] = @member.errors.full_messages.to_sentence
      redirect_to new_member_path
    end
  end

  def edit
    @member = Member.find(params[:id])
    @role = ["User", "Coach", "Advocate", "Player", "Referee"]
  end

  def update
    @member = Member.find(params[:id])
    @role = ["User", "Coach", "Advocate", "Player", "Referee"]
    if @member.update(member_params)
      flash[:success] = "Member successfully updated!"
      redirect_to @member
    else
      flash[:danger] = @member.errors.full_messages.to_sentence
      redirect_to @member
    end
  end

  def show
    @member = Member.find(params[:id])
    @role = ["User", "Coach", "Advocate", "Player", "Referee"]
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    flash[:danger] = "Member successfully deleted!"
    redirect_to @member
  end

  private
  def member_params
    params.require(:member).permit(:first_name, :last_name, :email,
        :street, :city, :state, :zip, :addresstype, :role, :location_id, :phone,
        users_attributes: [:member_id]
    )
  end
end
