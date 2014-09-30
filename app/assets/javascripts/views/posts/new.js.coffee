class BasicBackbone.Views.PostsNew extends Backbone.View

  template: JST['posts/new']


  events:
    "click #save_post": "savePost"

  render: =>
    @$el.html(@template())
    @

  initialize: ->
    @collection = @options.collection

  savePost: (e) ->
    attributes =
      title: @$("#post_title").val()
      content: @$("#post_content").val()
      author_id: "1"
    @collection.create(attributes, {
        success: -> 
          alert('success')
          window.routerPosts.navigate("#posts", {trigger: true})
          return
        error: ->
          alert('failed')
          return
    });

  renderError: ->