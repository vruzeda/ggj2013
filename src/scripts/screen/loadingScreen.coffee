define [
    "kinetic"
    "sm2"
    "framework/screen"
    "framework/imageLoader"
    "framework/counterLatch"
    "screen/mainScreen"
], (Kinetic, SM2, Screen, ImageLoader, CounterLatch, MainScreen) ->

    class LoadingScreen extends Screen

        IMAGE_MANIFEST =
            MAIN_SCREEN:
                startGameButton: "images/startGameButton.png"
                mainBackground:  "images/startBackground.png"

            GAME_SCREEN:
                background: "images/background.png"
                table:      "images/table.png"
                ceil:       "images/ceil.png"

            CHARACTER_NERFED:
                nerfed_crouching:       "images/character/nerfed/standing.png"
                nerfed_movingCrouching: "images/character/nerfed/walking.png"
                nerfed_standing:        "images/character/nerfed/standing.png"
                nerfed_moving:          "images/character/nerfed/walking.png"
                nerfed_jumping:         "images/character/nerfed/jumping.png"
                nerfed_movingJumping:   "images/character/nerfed/jumping.png"
                nerfed_falling:         "images/character/nerfed/jumping.png"
                nerfed_movingFalling:   "images/character/nerfed/jumping.png"
                nerfed_warmingLeft:     "images/character/nerfed/warmingLeft.png"
                nerfed_warmingRight:    "images/character/nerfed/warmingRight.png"

            CHARACTER_REGULAR:
                regular_standing:        "images/character/regular/standing.png"
                regular_moving:          "images/character/regular/walking.png"
                regular_jumping:         "images/character/regular/jumping.png"
                regular_movingJumping:   "images/character/regular/jumping.png"
                regular_falling:         "images/character/regular/jumping.png"
                regular_movingFalling:   "images/character/regular/jumping.png"
                regular_warmingLeft:     "images/character/regular/warmingLeft.png"
                regular_warmingRight:    "images/character/regular/warmingRight.png"

            CHARACTER_PUMPED:
                pumped_standing:        "images/character/pumped/standing.png"
                pumped_moving:          "images/character/pumped/walking.png"
                pumped_jumping:         "images/character/pumped/jumping.png"
                pumped_movingJumping:   "images/character/pumped/jumping.png"
                pumped_falling:         "images/character/pumped/jumping.png"
                pumped_movingFalling:   "images/character/pumped/jumping.png"
                pumped_warmingLeft:     "images/character/pumped/warmingLeft.png"
                pumped_warmingRight:    "images/character/pumped/warmingRight.png"

            CHARACTER_CAPTURED:
                cardiacArrest_captured: "images/character/captured/cardiacArrest.png"
                heartAttack_captured:   "images/character/captured/heartAttack.png"

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

        SOUND_MANIFEST =
            BGM:
                titleScreen:    'sounds/bgm/titleScreen.mp3'
            SFX:
                jump1:          'sounds/sfx/jump1.mp3'
                jump2:          'sounds/sfx/jump2.mp3'
                move1:          'sounds/sfx/move1.mp3'
                move2:          'sounds/sfx/move2.mp3'
                move3:          'sounds/sfx/move3.mp3'

        _constructLayout: ->
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "flubber"

            @_layer.add @text = new Kinetic.Text
                text: 'Loading...'
                width:  @getWidth()
                align: "center"
                fontSize: 36,
                fontStyle: "bold",
                fill: "black",
                stroke: "white",
                strokeWidth: 1,
            @text.setY (@getHeight() - @text.getTextHeight()) / 2

            latch = new CounterLatch 2, @_loadComplete
            @_loadImages latch
            @_loadSounds latch

        _loadSounds: (latch) ->
            _createSounds = =>
                totalCount = 0
                loadedCount = 0 
                for category, sounds of SOUND_MANIFEST
                    for id, url of sounds
                        totalCount++
                        SM2.createSound
                            id: id
                            url: url
                            autoPlay: false
                            autoLoad: true
                            onload: =>
                                latch.step() if (++loadedCount) == totalCount

            SM2.setup
                url: './swf/'
                flashVersion: 9
                onready: _createSounds
                        
        _loadImages: (latch) ->
            ImageLoader.addToList IMAGE_MANIFEST

            setTimeout =>
                ImageLoader.loadImages
                    list: ["MAIN_SCREEN", "GAME_SCREEN", "CHARACTER_NERFED", "CHARACTER_REGULAR", "CHARACTER_PUMPED", "CHARACTER_CAPTURED", "OBJECTS", "SCIENTIST", "HUD"]

                    progressCallback: (total, complete, success) =>
                        @text.setText "Loading (#{Math.round complete / total * 100}%)"
                        @redraw()

                    completeCallback: =>
                        latch.step()
            , 500

        _loadComplete: =>
            @_game.switchScreen @, new MainScreen @_game

        _constructInputEvents: (inputController) ->

        _destroyInputEvents: (inputController) ->


    return LoadingScreen