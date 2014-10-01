class BasicBackbone.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']
 	render: =>
    @$el.html(@template(posts: @collection.models))
    debugger
    @

  initialize: ->
    @collection = @options.collection
    @router = @options.router
    @collection.on "all", @render, this
