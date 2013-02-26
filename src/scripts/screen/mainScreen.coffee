define [
    "kinetic"
    "sm2"
    "framework/screen"
    "framework/imageLoader"
    "screen/gameScreen"
    "screen/creditsScreen"
], (Kinetic, SM2, Screen, ImageLoader, GameScreen, CreditsScreen) ->

    class MainScreen extends Screen

        _constructLayout: ->
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "mainBackground"

            @_layer.add @_startGame = new Kinetic.Image
                image: ImageLoader.getImage "startGameButton"
                x: 240
                y: 430
            @_startGame.handler = @_onStartGame

            @_layer.add @_credits = new Kinetic.Image
                image: ImageLoader.getImage "creditsButton"
                x: 240
                y: 550
            @_credits.handler = @_onCredits

            @_setActiveButton @_startGame

        _setActiveButton: (activeButton) ->
            @_activeButton = activeButton

            unless @_highlight?
                @_layer.add @_highlight = new Kinetic.Rect
                    stroke: "white"
                    strokeWidth: 3

            @_highlight.setAttrs
                x: @_activeButton.getX() - 10
                y: @_activeButton.getY() - 10
                width:  20 + @_activeButton.getWidth()
                height: 20 + @_activeButton.getHeight()

            @redraw()

        _constructInputEvents: (inputController) ->
            constructInputEvents = =>
                inputController.addCharListener "ENTER", @_handleActiveButtonPressed
                inputController.addCharListener "H",     @_handleActiveButtonPressed

                inputController.addCharListener "UP",   @_activateStartGameButton
                inputController.addCharListener "DOWN", @_activateCreditsButton

            setTimeout constructInputEvents, 200

        _destroyInputEvents: (inputController) ->
            inputController.removeCharListener "ENTER", @_handleActiveButtonPressed
            inputController.removeCharListener "H",     @_handleActiveButtonPressed

            inputController.removeCharListener "UP",   @_activateStartGameButton
            inputController.removeCharListener "DOWN", @_activateCreditsButton

        _handleActiveButtonPressed: =>
            @_activeButton.handler()

        _activateStartGameButton: =>
            @_setActiveButton @_startGame

        _activateCreditsButton: =>
            @_setActiveButton @_credits

        _onStartGame: =>
            @_game.switchScreen @, new GameScreen @_game

        _onCredits: =>
            @_game.switchScreen @, new CreditsScreen @_game


    return MainScreen