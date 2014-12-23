class BioChangesController < ApplicationController
  before_action :set_bio_change, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @bio_changes = BioChange.for_user(current_user).includes(:user).page(params[:page])
    respond_with @bio_changes
  end

  def show
    respond_with @bio_change
  end

  def new
    @bio_change = BioChange.new
  end

  def edit
  end

  def create
    @bio_change = BioChange.new(bio_change_params)

    respond_with do |format|
      if @bio_change.save
        format.html { redirect_to @bio_change, notice: 'Bio change was successfully created.' }
        format.json { render json: @bio_change, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @bio_change.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def update
    respond_with do |format|
      if @bio_change.update(bio_change_params)
        format.html { redirect_to @bio_change, notice: 'Bio change was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bio_change.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def destroy
    @bio_change.destroy
    respond_to do |format|
      format.html { redirect_to bio_changes_url }
      format.json { head :no_content }
    end
  end

  private
    def set_bio_change
      @bio_change = BioChange.find(params[:id])
    end

    def bio_change_params
      params.require(:bio_change).permit(:user_id, :content)
    end
end
