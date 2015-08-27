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

post '/post/update' do
  # Look in app/views/index.erb
  input_id = params[:input_post_id]
  input_title = params[:input_post_title]
  input_body = params[:input_post_body]

  # get all tags, clear spacing, split by ','
  input_tags_obj = Tag.create_tag(params[:input_post_tags])

  curr_post = Post.find(input_id)
  curr_post[:post_title] = input_title
  curr_post[:post_body] = input_body

  if curr_post.save
    curr_post.tags.delete_all

    input_tags_obj.each do |t|
      curr_post.tags << t
    end

    path = "/post/#{curr_post.id}"
  else
    session[:err_msg] = "Unable to update post. Please try again."
    path = "/post/#{curr_post.id}/edit"
  end

  # update_post = Post.update(input_id, post_title: input_title, post_body: input_body)


  path = "/"
  redirect to path
end

get '/post/:id' do
  # Look in app/views/index.erb
  @post = Post.find(params[:id])
  erb :post
end

get '/post/:id/edit' do
  # Look in app/views/index.erb
  @err_msg = ""
  unless session[:err_msg] == nil
    @err_msg = session[:err_msg]
    session[:err_msg] = nil
  end

  @post = Post.find(params[:id])
  @tag_string = ""

  @post.tags.each do |pt|
    @tag_string << ", " unless @tag_string.empty?
    @tag_string << pt.tag
  end

  erb :post_edit
end

get '/post/:id/delete' do
  # Look in app/views/index.erb
  curr_post = Post.find(params[:id])

  curr_post.tags.delete_all

  curr_post.delete

  path = "/"
  redirect to path
end