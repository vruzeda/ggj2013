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
                    ceil:                         "images/ceil.png"

                CHARACTER_REGULAR:
                    standing_regular:      "images/character/regular/standing.png"
                    moving_regular:        "images/character/regular/walking.png"
                    jumping_regular:       "images/character/regular/jumping.png"
                    movingJumping_regular: "images/character/regular/jumping.png"
                    falling_regular:       "images/character/regular/falling.png"
                    movingFalling_regular: "images/character/regular/falling.png"
                    warmingLeft_regular:   "images/character/regular/warmingLeft.png"
                    warmingRight_regular:  "images/character/regular/warmingRight.png"

                CHARACTER_PUMPED:
                    standing_pumped:       "images/character/pumped/standing.png"
                    moving_pumped:         "images/character/pumped/walking.png"
                    jumping_pumped:        "images/character/pumped/jumping.png"
                    movingJumping_pumped:  "images/character/pumped/jumping.png"
                    falling_pumped:        "images/character/pumped/falling.png"
                    movingFalling_pumped:  "images/character/pumped/falling.png"
                    warmingLeft_pumped:    "images/character/pumped/warmingLeft.png"
                    warmingRight_pumped:   "images/character/pumped/warmingRight.png"

                OBJECTS:
                    becker:     "images/objects/becker.png"
                    bookPile:   "images/objects/bookPile.png"
                    books:      "images/objects/books.png"
                    bureta:     "images/objects/bureta.png"
                    conico:     "images/objects/conico.png"
                    redondo:    "images/objects/roundOne.png"
                    support:    "images/objects/support.png"
                    microscope: "images/objects/microscope.png"
                    tripe:      "images/objects/tripe.png"
                    tubes:      "images/objects/tubes.png"

                SCIENTIST:
                    scientist:  "images/enemy/scientist.png"
                    arm:        "images/enemy/arm.png"


            setTimeout =>
                ImageLoader.loadImages
                    list: ["MAIN_SCREEN", "GAME_SCREEN", "CHARACTER_REGULAR", "CHARACTER_PUMPED", "OBJECTS"]

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