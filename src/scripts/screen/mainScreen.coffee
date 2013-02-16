define [
    "kinetic"
    "sm2"
    "framework/screen"
    "framework/imageLoader"
    "screen/gameScreen"
    "screen/optionsScreen"
], (Kinetic, SM2, Screen, ImageLoader, GameScreen, OptionsScreen) ->

    class MainScreen extends Screen

        _constructLayout: ->
            # Background
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "mainBackground"

            # Start Game button
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "startGameButton"
                x: 240
                y: 430

        _constructInputEvents: (inputController) ->
            inputController.addCharListener "ENTER", @onStartGame
            inputController.addCharListener "H",     @onStartGame

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "ENTER", @onStartGame
            inputController.removeCharListener "H",     @onStartGame

        onStartGame: =>
            @_game.switchScreen @, new GameScreen @_game


    return MainScreen