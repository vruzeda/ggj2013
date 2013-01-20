define [
    "kinetic"
    "framework/screen"
], (Kinetic, Screen) ->

    class SimpleScreen extends Screen

        NUMBER_OF_RECTS = 10

        _constructLayout: ->
            for rectIndex in [1..NUMBER_OF_RECTS]
                @_layer.add new Kinetic.Rect
                    id: "rect_#{rectIndex}"
                    width: 100
                    height: 100
                    fill: "rgb(#{Math.floor Math.random() * 256}, 0, 0)"
                    stroke: "black"
                    strokeWidth: 4

        _constructInputEvents: (inputController) ->
            for rectIndex in [1..NUMBER_OF_RECTS]
                rect = @_layer.get("#rect_#{rectIndex}")[0]
                inputController.addClickListener rect, @onRectClick

            inputController.addCharListener "W", @onMoveUp
            inputController.addCharListener "A", @onMoveLeft
            inputController.addCharListener "S", @onMoveDown
            inputController.addCharListener "D", @onMoveRight

        onRectClick: (@_rect) =>
            @_rect.setX Math.floor Math.random() * (@getWidth() - @_rect.getWidth())
            @_rect.setY Math.floor Math.random() * (@getHeight() - @_rect.getHeight())
            @redraw()

        onMoveUp: =>
            if @_rect?
                @_rect.setY Math.max @_rect.getY() - @_rect.getHeight(), 0
                @redraw()

        onMoveLeft: =>
            if @_rect?
                @_rect.setX Math.max @_rect.getX() - @_rect.getWidth(), 0
                @redraw()

        onMoveDown: =>
            if @_rect?
                @_rect.setY Math.min @_rect.getY() + @_rect.getHeight(), (@getHeight() - @_rect.getHeight())
                @redraw()

        onMoveRight: =>
            if @_rect?
                @_rect.setX Math.min @_rect.getX() + @_rect.getWidth(), (@getWidth() - @_rect.getWidth())
                @redraw()


    return SimpleScreen