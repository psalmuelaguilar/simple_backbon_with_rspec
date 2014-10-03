class BasicBackbone.Models.Author extends Backbone.Model
  url: ->
    if (this.isNew())
      this.urlRoot
    else
      this.urlRoot + this.get('id')
  urlRoot: '/authors/'
  defaults:
    id: null
    name: null
