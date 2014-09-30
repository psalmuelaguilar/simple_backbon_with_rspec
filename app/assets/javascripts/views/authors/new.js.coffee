class BasicBackbone.Views.AuthorsNew extends Backbone.View

  template: JST['authors/new']


  events:
    "click #save_author": "saveAuthor"

  render: => 
    @$el.html(@template())
    @

  initialize: ->
    @collection = @options.collection


  saveAuthor: (e) ->
    attributes =
      name: @$("#author_name").val()

    @collection.create(attributes, {
        success: -> 
          alert('success')
          window.routerAuthors.navigate("#Authors", {trigger: true})
          return
        error: ->
          alert('failed')
          return
    });
