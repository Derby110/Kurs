class BookCreatorsController < ApplicationController
  before_action :set_book_creator, only: [:show, :edit, :update, :destroy]

  # GET /book_creators
  # GET /book_creators.json
  def index
    @book_creators = BookCreator.all
  end

  # GET /book_creators/1
  # GET /book_creators/1.json
  def show
  end

  # GET /book_creators/new
  def new
    @book_creator = BookCreator.new
  end

  # GET /book_creators/1/edit
  def edit
  end

  # POST /book_creators
  # POST /book_creators.json
  def create
    @book_creator = BookCreator.new(book_creator_params)

    respond_to do |format|
      if @book_creator.save
        format.html { redirect_to @book_creator, notice: 'Book creator was successfully created.' }
        format.json { render :show, status: :created, location: @book_creator }
      else
        format.html { render :new }
        format.json { render json: @book_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_creators/1
  # PATCH/PUT /book_creators/1.json
  def update
    respond_to do |format|
      if @book_creator.update(book_creator_params)
        format.html { redirect_to @book_creator, notice: 'Book creator was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_creator }
      else
        format.html { render :edit }
        format.json { render json: @book_creator.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_creators/1
  # DELETE /book_creators/1.json
  def destroy
    @book_creator.destroy
    respond_to do |format|
      format.html { redirect_to book_creators_url, notice: 'Book creator was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_creator
      @book_creator = BookCreator.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_creator_params
      params.require(:book_creator).permit(:book_id, :creator_id)
    end
end
