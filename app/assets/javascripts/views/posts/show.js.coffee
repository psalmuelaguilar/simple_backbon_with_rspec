class BasicBackbone.Views.PostsShow extends Backbone.View

  template: JST['posts/show']

  el: '.content'
  
  render: ->
    @$el.html(@template({post: @options}))
    @
  
  initialize: ->
    @collection = @options.model
    @router = @options.router
    @collection.on "all", @render, this

