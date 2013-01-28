define [
    "kinetic"
], (Kinetic) ->

    class Screen

        constructor: (@_game, @_width = @_game.getWidth(), @_height = @_game.getHeight()) ->
            @_layer = new Kinetic.Layer

        init: ->
            @_constructLayout()
            @_constructInputEvents @_game.getInputController()
            @redraw()

        destroy: ->
            @_destroyInputEvents @_game.getInputController()
            @_layer.remove()

        # Abstract
        _constructLayout: ->
            throw new Error "Cannot invoke abstract method Screen._constructLayout()."

        # Abstract
        _constructInputEvents: (inputController) ->
            throw new Error "Cannot invoke abstract method Screen._constructInputEvents(inputController)."

        # Abstract
        _destroyInputEvents: (inputController) ->
            throw new Error "Cannot invoke abstract method Screen._destroyInputEvents(inputController)."

        redraw: ->
            @_layer.draw()

        getLayer: ->
            @_layer

        getWidth: ->
            @_width

        getHeight: ->
            @_height


    return Screen