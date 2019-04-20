class CommentsController < ApplicationController
    before_action :authenticate_user!
    # include CanCan::ControllerAdditions
    # load_and_authorize_resource
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        # authorize! :create, @article
        redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        # authorize! :destroy, @comment
        @comment.destroy
        redirect_to article_path(@article)
    end
     
    private
        def comment_params
          params.require(:comment).permit(:commenter, :body)
        end
end


