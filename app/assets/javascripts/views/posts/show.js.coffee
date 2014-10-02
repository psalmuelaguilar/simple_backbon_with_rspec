class BasicBackbone.Views.PostsShow extends Backbone.View

  template: JST['posts/show']

  el: '.content'

  initialize: ->
    @render()

  render: ->
    @$el.html(@template(@model))
    @