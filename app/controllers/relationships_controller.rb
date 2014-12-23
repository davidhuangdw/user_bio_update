class RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :edit, :update, :destroy]

  def index
    @relationships = Relationship.all
    respond_with @relationships
  end

  def show
    respond_with @relationship
  end

  def new
    @relationship = Relationship.new
  end

  def edit
  end

  def create
    @relationship = Relationship.new(relationship_params)

    respond_with do |format|
      if @relationship.save
        @user = @relationship.followed
        format.html { redirect_to @relationship, notice: 'Relationship was successfully created.' }
        format.json { render json: @relationship, status: :created }
      else
        format.html { render action: 'new' }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def update
    respond_with do |format|
      if @relationship.update(relationship_params)
        format.html { redirect_to @relationship, notice: 'Relationship was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @relationship.errors, status: :unprocessable_entity }
        format.js {head :unprocessable_entity}
      end
    end
  end

  def destroy
    @user = @relationship.followed
    @relationship.destroy
    respond_with do |format|
      format.html { redirect_to relationships_url }
      format.json { head :no_content }
    end
  end

  private
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    def relationship_params
      params.require(:relationship).permit(:follower_id, :followed_id)
    end
end
