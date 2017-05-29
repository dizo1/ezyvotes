class PageantsController < ApplicationController
  before_action :set_pageant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  # GET /pageants
  # GET /pageants.json
  def index
    @pageants = Pageant.all
  end

  # GET /pageants/new
  def new
   # @pageant = current_user.pageant.build 
   @pageant = Pageant.new
  end
  
  def create
    #@pageant = Pageant.new(pageant_params)
      @pageant = current_user.pageants.new(pageant_params)
      #git @pageant.user_id = current_user
      if @pageant.save
        flash[:success] = "Pageant was created successfully"
        redirect_to pageant_path(@pageant)
      else
        render 'new'
      end
    end
  # GET /pageants/1
  # GET /pageants/1.json
  def show
  end

  # GET /pageants/1/edit
  def edit
  end

  
  # PATCH/PUT /pageants/1
  # PATCH/PUT /pageants/1.json
  def update
    respond_to do |format|
      if @pageant.update(pageant_params)
        format.html { redirect_to @pageant, notice: 'Pageant was successfully updated.' }
        format.json { render :show, status: :ok, location: @pageant }
      else
        format.html { render :edit }
        format.json { render json: @pageant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pageants/1
  # DELETE /pageants/1.json
  def destroy
    @pageant.destroy
        flash[:danger] = "Pageant and all associated contestants have been deleted"
        redirect_to pageants_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pageant
      @pageant = Pageant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pageant_params
      #params.fetch(:pageant, {})
        params.require(:pageant).permit(:name, :description, :category, :timezone, :image, :startdate, :enddate, :user_id)
      end
      def require_same_user
        if current_user != @user
          flash[:danger] = "You can only edit or delete your own account"
          redirect_to pageants_path
        end
      end
    end
