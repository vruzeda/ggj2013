define [
    "kinetic"
    "framework/screen"
], (Kinetic, Screen) ->

    class SimpleScreen extends Screen

        NUMBER_OF_RECTS = 10

        _constructLayout: ->
            for rectIndex in [1..NUMBER_OF_RECTS]
                rect = new Kinetic.Rect
                    width: 100
                    height: 100
                    fill: "rgb(#{Math.floor Math.random() * 256}, 0, 0)"
                    stroke: "black"
                    strokeWidth: 4
                @registerOnClickListener rect, @onRectClick

                @_layer.add rect

        onRectClick: (rect) =>
            rect.setX Math.floor Math.random() * (@getWidth() - rect.getWidth())
            rect.setY Math.floor Math.random() * (@getHeight() - rect.getHeight())
            @redraw()


    return SimpleScreen