get '/' do
  # Look in app/views/index.erb
  @posts = Post.order(created_at: :desc)
  erb :index
end