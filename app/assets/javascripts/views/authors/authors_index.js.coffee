class BasicBackbone.Views.AuthorsIndex extends Backbone.View

  template: JST['authors/index']
  navigation: JST['helpers/navigation']

  render: =>
    $('.nav').html(@navigation)
    @$el.html(@template(authors: @collection.models))
    @ 

  initialize: ->
    @collection = @options.collection
    @collection.on "all", @render, @



