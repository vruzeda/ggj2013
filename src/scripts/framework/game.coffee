define [
    "jquery"
    "kinetic"
    "framework/inputController"
], ($, Kinetic, InputController) ->

    class Game

        constructor: (@_containerId, @_width = 800, @_height = 600) ->
            $("##{@_containerId}").focus()
            $("##{@_containerId}").css "width",  @_width
            $("##{@_containerId}").css "height", @_height
            $("##{@_containerId}").css "margin-left", -1 * @_width  / 2
            $("##{@_containerId}").css "margin-top",  -1 * @_height / 2
            $("##{@_containerId}").css "position", "absolute"
            $(window).resize =>
                availableResolution =
                    width:  $(window).width()
                    height: $(window).height()

                scale =
                    x: availableResolution.width  / @_width
                    y: availableResolution.height / @_height

                bestScale = Math.min scale.x, scale.y, 1

                for scaleAttribute in ["-webkit-transform", "-moz-transform", "-ms-transform", "-o-transform", "transform"]
                    $("##{@_containerId}").css scaleAttribute, "scale(#{bestScale}, #{bestScale})"

            @_stage = new Kinetic.Stage
                container: @_containerId
                width: @_width
                height: @_height

            $(window).resize()

            @showScreen @_getInitialScreen()

        # Abstract
        _getInitialScreen: ->
            throw new Error "Cannot invoke abstract method Game._getInitialScreen()."

        getInputController: ->
            InputController.getInstance @_containerId

        switchScreen: (oldScreen, newScreen) ->
            @showScreen newScreen
            @hideScreen oldScreen

        showScreen: (screen) ->
            @_stage.add screen.getLayer()
            screen.init()

        hideScreen: (screen) ->
            screen.destroy()

        getWidth: ->
            @_width

        getHeight: ->
            @_height


    return Game