define [
    "jquery"
    "kinetic"
    "framework/inputController"
], ($, Kinetic, InputController) ->

    class Game

        constructor: (@_containerId, @_width = 800, @_height = 600) ->
            @_stage = new Kinetic.Stage
                container: @_containerId
                width: @_width
                height: @_height

            @showScreen @_getInitialScreen()

        # Abstract
        _getInitialScreen: ->
            throw new Error "Cannot invoke abstract method Game._getInitialScreen()."

        getInputController: ->
            InputController.getInstance @_containerId

        showScreen: (screen) ->
            @_stage.add screen.getLayer()
            screen.init()

        hideScreen: (screen) ->
            screen.getLayer().remove()

        getWidth: ->
            @_width

        getHeight: ->
            @_height


    return Game