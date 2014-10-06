class BasicBackbone.Models.Post extends Backbone.Model
  url: ->
    if (this.isNew())
      this.urlRoot
    else
      this.urlRoot + this.get('id')
  urlRoot: '/posts/'

  defaults:
    id: null
    title: null
    author_id: null
    content: null

  initialize: ->
    @author = new BasicBackbone.Models.Author(@get('author'))
    

