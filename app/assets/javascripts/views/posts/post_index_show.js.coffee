class BasicBackbone.Views.PostIndexShow extends Backbone.View
  
  template: JST['posts/index_show']
  

  render: ->
    @$el.html @template post: @model
    @
