class CommentsController < ApplicationController	

	#Only registered users can delete comments
	http_basic_authenticate_with name: "admin", password: "secret", only: :destroy

	
	def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.create(comment_params)
	    redirect_to post_path(@post)
  	end
 
  
    def comment_params
     	params.require(:comment).permit(:commenter, :body)
    end

    def destroy
    	@post = Post.find(params[:post_id])
    	@comment = @post.comments.find(params[:id])
    	@comment.destroy
    	redirect_to post_path(@post)
  	end
end
