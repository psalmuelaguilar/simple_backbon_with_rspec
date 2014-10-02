class BasicBackbone.Views.PostsShow extends Backbone.View

  template: JST['posts/show']

  el: '.content'

  initialize: ->
    console.log("post show")

  render: ->
    @$el.html(@template({post: @model}))
    @