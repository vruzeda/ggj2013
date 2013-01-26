define [
    "kinetic"
    "framework/screen"
    "framework/imageLoader"
    "screen/mainScreen"
], (Kinetic, Screen, ImageLoader, MainScreen) ->

    class LoadingScreen extends Screen

        _constructLayout: ->
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "flubber"

            text = new Kinetic.Text
                text: 'Loading...'
                width:  @getWidth()
                align: "center"
                fontSize: 36,
                fontStyle: "bold",
                fill: "black",
                stroke: "white",
                strokeWidth: 1,
            text.setY (@getHeight() - text.getTextHeight()) / 2
            @_layer.add text

            ImageLoader.addToList
                MAIN_SCREEN:
                    startGameButton: "images/startGameButton.png"
                    optionsButton: "images/optionsButton.png"
                    background: "images/background.png"

                GAME_SCREEN:
                    background: "images/background.png"
                    table: "images/table.png"
                    standingRegularCharacter:  "images/standingRegularCharacter.png"
                    walkingRegularCharacter:   "images/walkingRegularCharacter.png"
                    crouchingRegularCharacter: "images/crouchingRegularCharacter.png"
                    jumpingRegularCharacter:   "images/jumpingRegularCharacter.png"

            setTimeout =>
                ImageLoader.loadImages
                    list: ["MAIN_SCREEN", "GAME_SCREEN"]

                    progressCallback: (total, complete, success) =>
                        text.setText "Loading (#{Math.round complete / total * 100}%)"
                        @redraw()

                    completeCallback: =>
                        @_game.showScreen new MainScreen @_game
                        @_game.hideScreen @
            , 500

        _constructInputEvents: (inputController) ->

        _destroyInputEvents: (inputController) ->


    return LoadingScreen