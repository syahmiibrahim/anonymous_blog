post "/tag" do
  unless params[:input_tag].empty?
    redirect to "/tag/#{params[:input_tag]}"
  else
    session[:err_msg] = "You have search for an empty tag. What!?"
    redirect to '/'
  end
end

get "/tag/:tag" do
  if Tag.exists?(tag: params[:tag])
    @tag = Tag.find_by(tag: params[:tag])
    erb :tag
  else
    session[:err_msg] = "The tag does not exist. Create a post now and add your own tag! :D"
    redirect to '/'
  end
end