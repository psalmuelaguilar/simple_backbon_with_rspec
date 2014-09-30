class BasicBackbone.Routers.Posts extends Backbone.Router
  routes:
    "posts": "index"
    "posts/new": "new"
    "posts/:id/edit": "edit"

  initialize: ->
    @posts = new BasicBackbone.Collections.Posts()
    @posts.fetch()

  index: ->
    # console.log 'post index running'
    view = new BasicBackbone.Views.PostsIndex
      el: $(".content"),
      collection: @posts,
      router: @
    view.render()

  new: ->

    console.log 'post new running'
    @view = new BasicBackbone.Views.PostsNew
      el: $(".content"),
      collection: @posts,
      router: @
    @view.render()

  edit: (id) ->
    @post = @posts.get(id)
    view = new BasicBackbone.Views.PostsEdit
      el: $(".content"),
      model: @post,
      brands: @brands,
      router: @
    view.render()