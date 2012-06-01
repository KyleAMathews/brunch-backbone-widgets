ModalTemplate = require 'widgets/modal/modal'

module.exports = class ModalView extends Backbone.View

  events:
    'click': 'clickRepeater'

  className: 'modal'

  render: ->
    @$el.html ModalTemplate( @options )
    $( @el ).modal()

    # Add a class to the modal if one was passed in.
    if @options.class?
      if _.isArray @options.class
        for className in @options.class
          $('.modal.in').addClass className
      else
        $('.modal.in').addClass @options.class

    @

  body: (body) ->
    @$('.modal-body').html body

  clickRepeater: (e) ->
    @trigger 'click', e

module.exports.prototype = _.extend module.exports.prototype, Backbone.Events
