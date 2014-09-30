window.BasicBackbone =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    window.routerPosts = new BasicBackbone.Routers.Posts()
    window.routerPosts = new BasicBackbone.Routers.Authors()
    Backbone.history.start()

$(document).ready ->
  BasicBackbone.init()

window.ViewsHelpers =
  processInputs: (form, model) ->
    inputs = $(form).find(".inputs").children(":input")
    attributes = {}
    _.each inputs, (input, a) ->
      inputVal = $(input).val()
      if inputVal.length
        inputName = $(input).attr("id")
        attributes[inputName] = inputVal unless inputVal is model.get(inputName)
    attributes