define [
    "kinetic"
    "framework/screen"
], (Kinetic, Screen) ->

    class OptionsScreen extends Screen

        _constructLayout: ->
            # TODO Actually implement this.
            width = @getWidth()
            height = @getHeight()

            for alpha in [0..100]
                @_layer.add new Kinetic.Rect
                    x: alpha * width / 100 + 1
                    y: 0
                    width: width / 100 + 2
                    height: height
                    fill: "black"
                    opacity: alpha / 100

        _constructInputEvents: (inputController) ->

        _destroyInputEvents: (inputController) ->


    return OptionsScreen