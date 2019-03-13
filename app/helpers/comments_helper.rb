module CommentsHelper
  def comment_params
    params.require(:comment).permit(:content)
  end  
end
