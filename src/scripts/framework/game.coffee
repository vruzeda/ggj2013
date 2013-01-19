define [
    "kinetic"
], (Kinetic) ->

    class Game

        constructor: (containerId, @_width = 800, @_height = 600) ->
            @_stage = new Kinetic.Stage
                container: containerId
                width: @_width
                height: @_height

            @showScreen @_getInitialScreen()

        # Abstract
        _getInitialScreen: ->
            throw new Error "Cannot invoke abstract method Game._getInitialScreen."

        showScreen: (screen) ->
            @_stage.add screen.getLayer()

        hideScreen: (screen) ->
            screen.remove()

        getWidth: ->
            @_width

        getHeight: ->
            @_height


    return Game