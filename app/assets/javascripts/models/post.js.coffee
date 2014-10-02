class BasicBackbone.Models.Post extends Backbone.Model
  urlRoot: '/posts'

  defaults:
    id: null
    title: null
    author_id: null
    content: null

  initialize: ->
    @author = new BasicBackbone.Models.Author(@get('author'))