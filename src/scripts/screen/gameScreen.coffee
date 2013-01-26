define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
], (Kinetic, Screen, ImageLoader) ->

    class SimpleScreen extends Screen

        _constructLayout: ->
            @_layer.add new Kinetic.Rect
                width: @getWidth()
                height: @getHeight()
                fill: "green"

            for rectIndex, imageName of ["coffescript", "require", "kinetic", "jquery"]
                @_layer.add new Kinetic.Image
                    id: "rect_#{rectIndex}"
                    image: ImageLoader.getImage imageName

        _constructInputEvents: (inputController) ->
            for rectIndex of ["coffescript", "require", "kinetic", "jquery"]
                rect = @_layer.get("#rect_#{rectIndex}")[0]
                inputController.addClickListener rect, @onRectClick

            inputController.addCharListener "UP",    @onMoveUp
            inputController.addCharListener "DOWN",  @onMoveDown
            inputController.addCharListener "LEFT",  @onMoveLeft
            inputController.addCharListener "RIGHT", @onMoveRight

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "UP",    @onMoveUp
            inputController.removeCharListener "DOWN",  @onMoveDown
            inputController.removeCharListener "LEFT",  @onMoveLeft
            inputController.removeCharListener "RIGHT", @onMoveRight

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