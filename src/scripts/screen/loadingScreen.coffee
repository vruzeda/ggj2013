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
                    startGameButton: "images/startGameButton"
                    mainBackground:  "images/startBackground"

                GAME_SCREEN:
                    background: "images/background"
                    table:      "images/table"
                    ceil:       "images/ceil"

                CHARACTER_NERFED:
                    crouching_nerfed:       "images/character/nerfed/crouching"
                    movingCrouching_nerfed: "images/character/nerfed/crouching"
                    standing_nerfed:        "images/character/nerfed/standing"
                    moving_nerfed:          "images/character/nerfed/walking"
                    jumping_nerfed:         "images/character/nerfed/jumping"
                    movingJumping_nerfed:   "images/character/nerfed/jumping"
                    falling_nerfed:         "images/character/nerfed/falling"
                    movingFalling_nerfed:   "images/character/nerfed/falling"
                    warmingLeft_nerfed:     "images/character/nerfed/warmingLeft"
                    warmingRight_nerfed:    "images/character/nerfed/warmingRight"

                CHARACTER_REGULAR:
                    crouching_regular:       "images/character/regular/crouching"
                    movingCrouching_regular: "images/character/regular/crouching"
                    standing_regular:        "images/character/regular/standing"
                    moving_regular:          "images/character/regular/walking"
                    jumping_regular:         "images/character/regular/jumping"
                    movingJumping_regular:   "images/character/regular/jumping"
                    falling_regular:         "images/character/regular/falling"
                    movingFalling_regular:   "images/character/regular/falling"
                    warmingLeft_regular:     "images/character/regular/warmingLeft"
                    warmingRight_regular:    "images/character/regular/warmingRight"

                CHARACTER_PUMPED:
                    crouching_pumped:       "images/character/pumped/crouching"
                    movingCrouching_pumped: "images/character/pumped/crouching"
                    standing_pumped:        "images/character/pumped/standing"
                    moving_pumped:          "images/character/pumped/walking"
                    jumping_pumped:         "images/character/pumped/jumping"
                    movingJumping_pumped:   "images/character/pumped/jumping"
                    falling_pumped:         "images/character/pumped/falling"
                    movingFalling_pumped:   "images/character/pumped/falling"
                    warmingLeft_pumped:     "images/character/pumped/warmingLeft"
                    warmingRight_pumped:    "images/character/pumped/warmingRight"

                CHARACTER_CAPTURED:
                    captured_cardiacArrest: "images/character/captured/cardiacArrest"
                    captured_heartAttack:   "images/character/captured/heartAttack"

                OBJECTS:
                    becker:             "images/objects/becker"
                    bookPile:           "images/objects/bookPile"
                    books:              "images/objects/books"
                    bureta:             "images/objects/bureta"
                    conico:             "images/objects/conico"
                    redondo:            "images/objects/roundOne"
                    support:            "images/objects/support"
                    microscope:         "images/objects/microscope"
                    tripe:              "images/objects/tripe"
                    frascoTripe:        "images/objects/frascoTripe"
                    tubes:              "images/objects/tubes"
                    tubesStructure:     "images/objects/tubesStructure"
                    locker:             "images/objects/locker"
                    endingWindow:       "images/objects/endingWindow"
                    windowBase:         "images/objects/windowBase"
                    light:              "images/objects/light"

                SCIENTIST:
                    scientist:  "images/enemy/scientist"
                    arm:        "images/enemy/arm"

                HUD:
                    cardiogram1: "images/hud/cardiogram1"
                    cardiogram2: "images/hud/cardiogram2"
                    hudDisplay:  "images/hud/display"

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