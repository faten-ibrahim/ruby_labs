class ArticlesController < ApplicationController
    before_action :authenticate_user!
    # include CanCan::ControllerAdditions
    load_and_authorize_resource
    # authorize_resource :class => false

    def index
        @articles = Article.all
        authorize! :read, @article
    end
    
    def new
        @article = Article.new
        authorize! :create, @article    
    end

    def show
        @article = Article.find(params[:id])
        authorize! :read, @article
    end


    def edit
        @article = Article.find(params[:id])
        authorize! :update, @article
       
    end
        

    def create
        @article = Article.new(article_params)
        @article.user_id = current_user.id
        authorize! :create, @article
       
        # @article.save
        # redirect_to @article

        if @article.save
            redirect_to @article
        else
            render 'new'
        end

    end

    def update
        @article = Article.find(params[:id])
        authorize! :update, @article
       
        if @article.update(article_params)
          redirect_to @article
        else
          render 'edit'
        end
       
    end

    def destroy
        @article = Article.find(params[:id])
        authorize! :destroy, @article
        @article.destroy
 
        redirect_to articles_path

       
    end
       
      private
        def article_params
          params.require(:article).permit(:title, :text)
        end
    
     

    # def create
    #     render plain: params[:article].inspect
    # end
end
