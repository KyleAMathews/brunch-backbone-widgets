ProgressBarTemplate = require 'widgets/progress_bar/progress_bar'
module.exports = class ProgressBarView extends Backbone.View

  render: ->
    @$el.html ProgressBarTemplate()
    @width(10)
    @

  width: (width) =>
    @$('.ui-progress').width(width + "%")
