define [
    "kinetic"
    "sm2"
    "framework/screen"
    "framework/imageLoader"
], (Kinetic, SM2, Screen, ImageLoader) ->

    class EndScreen extends Screen

        _constructLayout: ->
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "victory"

        _constructInputEvents: (inputController) ->
            inputController.addCharListener "ENTER", @goToMainScreen
            inputController.addCharListener "H",     @goToMainScreen

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "ENTER", @goToMainScreen
            inputController.removeCharListener "H",     @goToMainScreen

        goToMainScreen: =>
            MainScreen = require "screen/mainScreen"
            @_game.switchScreen @, new MainScreen @_game


    return EndScreen