class ContestantsController < ApplicationController
    
         before_action :set_contestant, only: [:show, :edit, :update, :delete]
    
    def index
        @contestants = Contestant.all
    end
    
    def new
        @contestant = Contestant.new
    end
    
    def create
        
          #@pageant = Pageant.find(params[:pageant_id])
            #@contestant = @pageant.contestants.create(contestant_params)
            #redirect_to pageant_path(@pageant)

        
            @contestant = Contestant.new(contestant_params)
                if @contestant.save
                session[:user_id] = @user_id
                flash[:success] = "Contestant created"
                redirect_to contestant_path(@contestant)   
                    else
                        render 'new'
                   end
                end
    
    def show
        #@chef_recipes = @chef.recipes.paginate(page: params[:page], per_page: 3)
    end
    
    def edit
        
    end
    
    def update
        if @contestant.update(contestant_params)
            flash[:success] = "Contestant was created successfully"
            redirect_to @contestant
        else
            render 'edit'
        end
    end
    
    def destroy
        #@contestant.destroy
        #flash[:danger] = "contestant has been deleted"
        #redirect_to contestants_path
        
            @pageant = Pageant.find(params[:pageant_id])
            @contestant = @pageant.contestants.find(params[:id])
            @contestant.destroy
            flash[:danger] = "contestant has been deleted"
            redirect_to pageant_path(@pageant)
        
        
    end
    
    private
    
        def contestant_params
            params.require(:contestant).permit(:con_num, :name, :profile, :image, :pageant_id)
        end
        
    
        def set_contestant
            @contestant = Contestant.find(params[:id])
        end
    
        def require_same_user
            if current_user != @user
                flash[:danger] = "You can only delete your own account"
                redirect_to root_path
            end
        end
end
