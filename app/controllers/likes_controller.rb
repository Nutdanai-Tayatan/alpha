class LikesController < ApplicationController

    def create
        @like = current_user.likes.new(like_params)
        if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
    
        end
        redirect_to @like.article
    end

    def destroy
        @like = current_user.likes.find(params[:id])
        article = @like.article
        @like.destroy
        redirect_to article
    end

    private

    def like_params
        params.require(:like).permit(:article_id)
    end

end
