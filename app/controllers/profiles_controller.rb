class ProfilesController < ApplicationController
  def show
  	
  	@user = User.find_by_profile_name(params[:id])
  	if @user
  	  @concepts = @user.concepts.order(created_at: :desc)
      @relationship = Relationship.where(
        follower_id: current_user.id,
        followed_id: @user.id
      ).first_or_initialize if current_user
  	  render action: :show
  	else
  	  render file: 'public/404', status: 404, formats: [:html]
  	end
  end
end
