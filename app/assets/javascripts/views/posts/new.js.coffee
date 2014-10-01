class BasicBackbone.Views.PostsNew extends Backbone.View

  template: JST['posts/new']


  events:
    "click #save_post": "savePost"

  render: =>
    @$el.html(@template(authors: @authors.models))
    @

  initialize: ->
    @collection = @options.collection
    @authors = @options.authors
    @authors.on "all", @render, this

  savePost: (e) ->
    tags = @$("[name='hidden-tags']").val().split(",")
    tagsAttributes = [] 
    $.each tags, (index, value) ->
      tagsAttributes.push({name: value})
    attributes = 
      title: @$("#post_title").val()
      content: @$("#post_content").val()
      author_id: @$("#post_author_id").val()
      posttags_attributes: tagsAttributes
    debugger
    @collection.create(attributes, {
        success: -> 
          alert('success')
          window.routerPosts.navigate("#posts", {trigger: true})
          return
        error: ->
          alert('failed')
          return
    });


