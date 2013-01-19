define [
    "kinetic"
    "framework/screen"
], (Kinetic, Screen) ->

    class SimpleScreen extends Screen

        _constructLayout: ->
            rect = new Kinetic.Rect
                width: 100
                height: 100
                fill: "green"
                stroke: "black"
                strokeWidth: 4
            @registerOnClickListener rect, @onRectClick

            @_layer.add rect

        onRectClick: (rect) =>
            rect.setX Math.floor Math.random() * @getWidth()
            rect.setY Math.floor Math.random() * @getHeight()
            @redraw()


    return SimpleScreen