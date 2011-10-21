#= require_self
#= require jquery
#= require json2
#= require spine
#= require spine/manager
#= require spine/ajax
#= require spine/tmpl
#= require spine/route
#= require_tree ./models
#= require_tree ./views
#= require_tree ./controllers

# Export the Models, Controllers into App object
# TODO: Consider App.Models, App.Controllers, App.Views
window.App = {}
