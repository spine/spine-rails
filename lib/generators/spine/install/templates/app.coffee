#= require jquery
#= require json2
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/route
#= require_self
#= require_tree ./models
#= require_tree ./views
#= require_tree ./controllers

# Export the Models, Controllers into App object
# TODO: Consider App.Models, App.Controllers, App.Views namespaces

window.App =
  view: (name)-> JST["views/#{name}"]
  render: (name, data)-> App.view(name)(data)

# Helpers / shortcuts for controllers
Spine.Controller.include
  # this allows writing:
  # `@generate 'show', post` instead of
  # `JST['views/posts/show'](post)`
  generate: (subViewName, data) ->
    protoString = @constructor.toString().match(/^function ([^\(]+)/)[1]
    areaName = protoString.toLowerCase()
    App.render "#{areaName}/#{subViewName}", data
