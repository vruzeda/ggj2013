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
                    mainBackground:  "images/startBackground.png"

                GAME_SCREEN:
                    background: "images/background.png"
                    table:      "images/table.png"
                    ceil:       "images/ceil.png"

                CHARACTER_NERFED:
                    crouching_nerfed:       "images/character/nerfed/crouching.png"
                    movingCrouching_nerfed: "images/character/nerfed/crouching.png"
                    standing_nerfed:        "images/character/nerfed/standing.png"
                    moving_nerfed:          "images/character/nerfed/walking.png"
                    jumping_nerfed:         "images/character/nerfed/jumping.png"
                    movingJumping_nerfed:   "images/character/nerfed/jumping.png"
                    falling_nerfed:         "images/character/nerfed/falling.png"
                    movingFalling_nerfed:   "images/character/nerfed/falling.png"
                    warmingLeft_nerfed:     "images/character/nerfed/warmingLeft.png"
                    warmingRight_nerfed:    "images/character/nerfed/warmingRight.png"

                CHARACTER_REGULAR:
                    crouching_regular:       "images/character/regular/crouching.png"
                    movingCrouching_regular: "images/character/regular/crouching.png"
                    standing_regular:        "images/character/regular/standing.png"
                    moving_regular:          "images/character/regular/walking.png"
                    jumping_regular:         "images/character/regular/jumping.png"
                    movingJumping_regular:   "images/character/regular/jumping.png"
                    falling_regular:         "images/character/regular/falling.png"
                    movingFalling_regular:   "images/character/regular/falling.png"
                    warmingLeft_regular:     "images/character/regular/warmingLeft.png"
                    warmingRight_regular:    "images/character/regular/warmingRight.png"

                CHARACTER_PUMPED:
                    crouching_pumped:       "images/character/pumped/crouching.png"
                    movingCrouching_pumped: "images/character/pumped/crouching.png"
                    standing_pumped:        "images/character/pumped/standing.png"
                    moving_pumped:          "images/character/pumped/walking.png"
                    jumping_pumped:         "images/character/pumped/jumping.png"
                    movingJumping_pumped:   "images/character/pumped/jumping.png"
                    falling_pumped:         "images/character/pumped/falling.png"
                    movingFalling_pumped:   "images/character/pumped/falling.png"
                    warmingLeft_pumped:     "images/character/pumped/warmingLeft.png"
                    warmingRight_pumped:    "images/character/pumped/warmingRight.png"

                CHARACTER_CAPTURED:
                    captured_cardiacArrest: "images/character/captured/cardiacArrest.png"
                    captured_heartAttack:   "images/character/captured/heartAttack.png"

                OBJECTS:
                    becker:             "images/objects/becker.png"
                    bookPile:           "images/objects/bookPile.png"
                    books:              "images/objects/books.png"
                    bureta:             "images/objects/bureta.png"
                    conico:             "images/objects/conico.png"
                    redondo:            "images/objects/roundOne.png"
                    support:            "images/objects/support.png"
                    microscope:         "images/objects/microscope.png"
                    tripe:              "images/objects/tripe.png"
                    frascoTripe:        "images/objects/frascoTripe.png"
                    tubes:              "images/objects/tubes.png"
                    tubesStructure:     "images/objects/tubesStructure.png"
                    locker:             "images/objects/locker.png"
                    endingWindow:       "images/objects/endingWindow.png"
                    windowBase:         "images/objects/windowBase.png"
                    light:              "images/objects/light.png"

                SCIENTIST:
                    scientist:  "images/enemy/scientist.png"
                    arm:        "images/enemy/arm.png"

                HUD:
                    cardiogram1: "images/hud/cardiogram1.png"
                    cardiogram2: "images/hud/cardiogram2.png"
                    hudDisplay:  "images/hud/display.png"

            setTimeout =>
                ImageLoader.loadImages
                    list: ["MAIN_SCREEN", "GAME_SCREEN", "CHARACTER_NERFED", "CHARACTER_REGULAR", "CHARACTER_PUMPED", "CHARACTER_CAPTURED", "OBJECTS", "SCIENTIST", "HUD"]

                    progressCallback: (total, complete, success) =>
                        text.setText "Loading (#{Math.round complete / total * 100}%)"
                        @redraw()

                    completeCallback: =>
                        @_game.switchScreen @, new MainScreen @_game
            , 500

        _constructInputEvents: (inputController) ->

        _destroyInputEvents: (inputController) ->


    return LoadingScreen