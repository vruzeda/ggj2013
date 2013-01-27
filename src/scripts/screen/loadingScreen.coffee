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
                    optionsButton:   "images/optionsButton.png"
                    background:      "images/background.png"

                GAME_SCREEN:
                    background:                   "images/background.png"
                    table:                        "images/table.png"
                    standing_regular_image:       "images/standingRegularCharacter.png"
                    moving_regular_image:         "images/walkingRegularCharacter.png"
                    jumping_regular_image:        "images/jumpingRegularCharacter.png"
                    movingJumping_regular_image:  "images/jumpingRegularCharacter.png"
                    falling_regular_image:        "images/fallingRegularCharacter.png"
                    movingFalling_regular_image:  "images/fallingRegularCharacter.png"

                OBJECTS:
                    becker:     "images/objects/becker.png"
                    bookPile:   "images/objects/bookPile.png"
                    books:      "images/objects/books.png"
                    bureta:     "images/objects/bureta.png"
                    conico:     "images/objects/conico.png"
                    redondo:    "images/objects/roundOne.png"
                    support:    "images/objects/support.png"
                    telescopio: "images/objects/telescopio.png"
                    tripe:      "images/objects/tripe.png"
                    tubes:      "images/objects/tubes.png"


                    # warmingLeftRegularCharacter:  "images/warmingLeftRegularCharacter.png"
                    # warmingRightRegularCharacter: "images/warmingRightRegularCharacter.png"

            setTimeout =>
                ImageLoader.loadImages
                    list: ["MAIN_SCREEN", "GAME_SCREEN", "OBJECTS"]

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