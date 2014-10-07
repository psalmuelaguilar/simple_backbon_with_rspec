class BasicBackbone.Views.PostsIndex extends Backbone.View

  # template: JST['posts/index']
 	
  # render: =>
  #   @$el.html(@template(posts: @collection.models))
  #   @

  # initialize: ->
  #   @collection = @options.collection
  #   @router = @options.router
  #   @collection.on "all", @render, this
  events: -> 
    'click .tag-link' : 'changeUrl'

  initialize: ->
    @model.on "change", @render, @

  changeUrl: (e) ->
    # current_url_params = deparam(Backbone.history.fragment)

    # delete current_url_params["posts?"]
    # delete current_url_params["posts"]
    # tag_id = e.currentTarget.dataset.tag
    # if current_url_params.tags
    #   debugger
    # else
    #   current_url = Backbone.history.fragment + "tags=" + tag_id

    # debugger
    # Backbone.history.navigate(Backbone.history.fragment, true)
    # debugger



  helpers:
    blockPagination: ->
      segment = @model.get('perPage')
      current =  @model.get('current_page') || 1
      range = _.range (current - segment), (current + segment+1), 1
      middle = _.filter range, (num) =>
        num > 0 and num <= @model.get('total_pages')

    nextPage: ->
      value = @model.get('current_page')
      total_pages = @model.get('total_pages')
      value = value + 1 unless value is total_pages
      value

    previousPage: ->
      value = @model.get('current_page')
      value = value - 1 unless value is 1
      value

    currentPage: ->
      @model.get('current_page')

    totalPages: ->
      @model.get('total_pages')

  template: JST['posts/index']
  pagination: JST['helpers/pagination']
  navigation: JST['helpers/navigation']

  render: ->
    $('.nav').html(@navigation)
    @$el.html @template _.extend(@, @helpers)
    @addOnebyOne @model.get('models')
    @$el.append $(@pagination(@))
    @

  addOnebyOne: (models) ->
    _.each models, ((post) ->
      view = new BasicBackbone.Views.PostIndexShow model: post
      @$('#index_posts').append view.render().el
    ), @

