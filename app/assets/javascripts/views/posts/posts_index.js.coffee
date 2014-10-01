class BasicBackbone.Views.PostsIndex extends Backbone.View

  template: JST['posts/index']
 	render: =>
    @$el.html(@template(posts: @collection.models))
    @

  initialize: ->
    @collection = @options.collection
    @collection.on "all", @render, this
