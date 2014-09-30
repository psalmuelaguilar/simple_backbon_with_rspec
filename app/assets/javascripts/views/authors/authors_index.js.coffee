class BasicBackbone.Views.AuthorsIndex extends Backbone.View

  template: JST['authors/index']

  render: =>
    @$el.html(@template(authors: @collection.models))
    @ 

  initialize: ->
    @collection = @options.collection
    @collection.on "all", @render, this

