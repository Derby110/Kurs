class StilagesController < ApplicationController
  before_action :set_stilage, only: [:show, :edit, :update, :destroy]

  # GET /stilages
  # GET /stilages.json
  def index
    @stilages = Stilage.all
  end

  # GET /stilages/1
  # GET /stilages/1.json
  def show
  end

  # GET /stilages/new
  def new
    @stilage = Stilage.new
    @stilage.room = Room.new
  end

  # GET /stilages/1/edit
  def edit
  end

  # POST /stilages
  # POST /stilages.json
  def create
    @stilage = Stilage.new(stilage_params)

    respond_to do |format|
      if @stilage.save
        format.html { redirect_to @stilage, notice: 'Stilage was successfully created.' }
        format.json { render :show, status: :created, location: @stilage }
      else
        format.html { render :new }
        format.json { render json: @stilage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stilages/1
  # PATCH/PUT /stilages/1.json
  def update
    respond_to do |format|
      if @stilage.update(stilage_params)
        format.html { redirect_to @stilage, notice: 'Stilage was successfully updated.' }
        format.json { render :show, status: :ok, location: @stilage }
      else
        format.html { render :edit }
        format.json { render json: @stilage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stilages/1
  # DELETE /stilages/1.json
  def destroy
    @stilage.destroy
    respond_to do |format|
      format.html { redirect_to stilages_url, notice: 'Stilage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stilage
      @stilage = Stilage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stilage_params
      params.require(:stilage).permit(:room_id, room_attributes:[:id, :_destroy, :schort_name, :long_name])
    end
    
     def check_ctr_auth()
      case action_name.to_sym
      when :show
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :index
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return true
        end
      when :new
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :create
        if @current_role_user.try(:is_admin?)
          return true
        end
        if @current_role_user.try(:is_operator?)
          return false
        end
      when :edit
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      when :destroy
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      else
        if @current_role_user.try(:is_operator?)
          return false
        end
        if @current_role_user.try(:is_admin?)
          return true
        end
      end
     end
end
