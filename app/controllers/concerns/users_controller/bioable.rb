class UsersController
  module Bioable
    def bio_change_count
      @user= User.find(params[:id])
      respond_to do |format|
        format.json {render json:@user.bio_update_count}
      end
    end

    def all_bio_changes
      @changes = BioChange.page(params[:page])
      respond_to do |format|
        format.json {render json:@changes}
      end
    end
  end
end