class BasicBackbone.Routers.Posts extends Backbone.Router
  routes:
    "posts": "index"
    "posts?page=:param" : "index"
    "posts/new": "new"
    "posts/:id/edit": "edit"
    "posts/:id": "show"



  initialize: ->
    @posts = new BasicBackbone.Collections.Posts()
    @authors = new BasicBackbone.Collections.Authors()
    
    @authors.fetch()

  index: (params)->
    if params
      debugger
      page = params.page
      @view = new BasicBackbone.Views.PostsIndex
        el: $(".content"),
        collection: @posts,
        authors: @authors,
        router: @

      @view.render()
    else
      this.navigate("/posts?page=1", {trigger: true})

  new: ->
    console.log 'post new running'
    @view = new BasicBackbone.Views.PostsNew
      el: $(".content"),
      collection: @posts,
      authors: @authors,
      router: @
    @view.render()

  show: (id) ->
    console.log id
    @post = new BasicBackbone.Models.Post({id: id})
    @post.fetch(
      success: (model, response, options)=>
        this.viewShowPost = new BasicBackbone.Views.PostsShow
          model: response,
          author: response.author,
          tag: response.tags
        this.viewShowPost.render();
        # @author = new BasicBackbone.Models.Author({id: @post.get('author_id')})
        # @author.fetch(
        #   success: =>
        #     debugger
        #     this.viewShowPost = new BasicBackbone.Views.PostsShow
        #       model: @post,
        #       author: @author,
        #       router: @
        #     this.viewShowPost.render();
        # )
    )

  edit: (id) ->
    @post = @posts.get(id)
    view = new BasicBackbone.Views.PostsEdit
      el: $(".content"),
      model: @post,
      authors: @authors,
      router: @
    view.render()
    
