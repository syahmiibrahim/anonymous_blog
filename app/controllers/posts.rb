get '/post/new' do
  # Look in app/views/index.erb
  @err_msg = ""
  unless session[:err_msg] == nil
    @err_msg = session[:err_msg]
    session[:err_msg] = nil
  end

  erb :post_new
end

post '/post/create' do
  # Look in app/views/index.erb
  input_title = params[:input_post_title]
  input_body = params[:input_post_body]
  #input_tags = params[:input_post_title]

  # get all tags, clear spacing, split by ','
  input_tags_obj = Tag.create_tag(params[:input_post_tags])

  new_post = Post.new(post_title: input_title, post_body: input_body)

  if new_post.save
    input_tags_obj.each do |t|
      new_post.tags << t
    end

    path = "/post/#{new_post.id}"
  else
    session[:err_msg] = "Unable to create new post. Please try again."
    path = '/post/new'
  end

  redirect to path
end

get '/post/:id' do
  # Look in app/views/index.erb
  @post = Post.find(params[:id])
  erb :post
end