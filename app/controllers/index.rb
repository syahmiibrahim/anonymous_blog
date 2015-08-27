get '/' do
  # Look in app/views/index.erb
  @err_msg = ""
  unless session[:err_msg] == nil
    @err_msg = session[:err_msg]
    session[:err_msg] = nil
  end

  @posts = Post.order(created_at: :desc)
  erb :index
end