class BasicBackbone.Routers.Authors extends Backbone.Router
  routes:
    "authors": "index"
    "authors/new": "new"
    "authors/:id/edit": "edit"

  initialize: ->
    @authors = new BasicBackbone.Collections.Authors()
    @authors.fetch()

  index: ->
    console.log 'author index running'
    view = new BasicBackbone.Views.AuthorsIndex
      el: $(".content"),
      collection: @authors,
      router: @
    view.render()

  new: ->
    console.log 'author new running'
    @view = new BasicBackbone.Views.AuthorsNew
      el: $(".content"),
      collection: @authors,
      router: @
    @view.render()

  edit: (id) ->
    @author = @authors.get(id)
    view = new BasicBackbone.Views.AuthorsEdit
      el: $(".content"),
      model: @author,
      router: @
    view.render()
