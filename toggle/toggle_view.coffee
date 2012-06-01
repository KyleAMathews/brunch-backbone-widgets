ToggleTemplate = require 'widgets/toggle/toggle'

module.exports = class ToggleView extends Backbone.View

  events:
    'mousedown button': 'toggleActive'

  render: ->
    @$el.html ToggleTemplate( buttons: @options.buttons )
    @$("button[data-machinename='#{ @options.active }']").addClass('active')

    # Add fastClick support.
    if $.fn.fastClick?
      @$('button').fastClick (e) =>
        @toggleActive(e)
    @

  setActive: (machinename) ->
    @$('button').removeClass 'active'
    @$("button[data-machinename='#{ machinename }']").addClass('active')

  toggleActive: (e) ->
    # Parent views using this widget can pass in a beforeToggle function
    # to validate or do other checks before allowing the toggle to
    # continue.
    if @options.beforeToggle
      @options.beforeToggle (e), @_toggle
    else
      @_toggle(e)

  _toggle: (error, e) =>
    unless error
      unless $(e.target).hasClass 'active'
        @$('button').removeClass 'active'
        $(e.target).addClass 'active'
        @trigger 'toggle', $(e.target).data('machinename')

module.exports.prototype = _.extend module.exports.prototype, Backbone.Events
