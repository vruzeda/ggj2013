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
                mainBackground:  "images/startBackground.png"
                startGameButton: "images/startGameButton.png"
                creditsButton:   "images/creditsButton.png"

            END_SCREEN:
                gameOver: "images/game-over.png"
                victory:  "images/victory.png"

            GAME_SCREEN:
                background: "images/background.png"
                table:      "images/table.png"
                ceil:       "images/ceil.png"

            CREDITS:
                credits: "images/credits.png"

            CHARACTER_NERFED:
                nerfed_crouching:        "images/character/nerfed/standing.png"
                nerfed_movingCrouching:  "images/character/nerfed/walking.png"
                nerfed_standing:         "images/character/nerfed/standing.png"
                nerfed_moving:           "images/character/nerfed/walking.png"
                nerfed_jumping:          "images/character/nerfed/jumping.png"
                nerfed_movingJumping:    "images/character/nerfed/jumping.png"
                nerfed_falling:          "images/character/nerfed/jumping.png"
                nerfed_movingFalling:    "images/character/nerfed/jumping.png"
                nerfed_warmingLeft:      "images/character/nerfed/warmingLeft.png"
                nerfed_warmingRight:     "images/character/nerfed/warmingRight.png"

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
                pumped_standing:         "images/character/pumped/standing.png"
                pumped_moving:           "images/character/pumped/walking.png"
                pumped_jumping:          "images/character/pumped/jumping.png"
                pumped_movingJumping:    "images/character/pumped/jumping.png"
                pumped_falling:          "images/character/pumped/jumping.png"
                pumped_movingFalling:    "images/character/pumped/jumping.png"
                pumped_warmingLeft:      "images/character/pumped/warmingLeft.png"
                pumped_warmingRight:     "images/character/pumped/warmingRight.png"

            CHARACTER_CAPTURED:
                cardiacArrest_captured:  "images/character/captured/cardiacArrest.png"
                heartAttack_captured:    "images/character/captured/heartAttack.png"

            CHARACTER_FREE:
                free_free:               "images/character/free/free.png"

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
                hudDisplay:  "images/hud/display.png",
                progressBar: "images/hud/progressBar.png",
                lindomar:    "images/hud/lindomar.png",
                copper:      "images/hud/copper.png"

            SIZE: 70

        SOUND_MANIFEST =
            BGM:
                titleScreen: "sounds/bgm/titleScreen.mp3"
            SFX:
                jump1:       "sounds/sfx/jump1.mp3"
                jump2:       "sounds/sfx/jump2.mp3"
                move1:       "sounds/sfx/move1.mp3"
                move2:       "sounds/sfx/move2.mp3"
                move3:       "sounds/sfx/move3.mp3"

            SIZE: 30

        PLUMBER_INITIAL_X = 120
        PLUMBER_FINAL_X   = 410

        _constructLayout: ->
            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "loading"

            @_layer.add @_plumber = new Kinetic.Image
                image: ImageLoader.getImage "plumber"
                x: PLUMBER_INITIAL_X
                y: 453

            @_layer.add new Kinetic.Image
                image: ImageLoader.getImage "syringe"
                x: 422
                y: 431

            @_loadedImageData = 0
            @_loadedSoundData = 0

            latch = new CounterLatch 2, @_loadComplete
            @_loadImages latch
            @_loadSounds latch

        _loadImages: (latch) ->
            ImageLoader.addToList IMAGE_MANIFEST
            ImageLoader.loadImages
                list: ["MAIN_SCREEN", "END_SCREEN", "GAME_SCREEN", "CREDITS", "CHARACTER_NERFED", "CHARACTER_REGULAR", "CHARACTER_PUMPED", "CHARACTER_CAPTURED", "CHARACTER_FREE", "OBJECTS", "SCIENTIST", "HUD"]

                progressCallback: (total, complete, success) =>
                    @_loadedImageData = IMAGE_MANIFEST.SIZE * complete / total
                    @_updateProgressBar()

                completeCallback: =>
                    latch.step()

        _loadSounds: (latch) ->
            createSounds = =>
                totalCount = 0
                loadedCount = 0
                for category in ["BGM", "SFX"]
                    sounds = SOUND_MANIFEST[category]
                    for id, url of sounds
                        totalCount++
                        SM2.createSound
                            id: id
                            url: url
                            autoPlay: false
                            autoLoad: true
                            onload: =>
                                loadedCount++

                                @_loadedSoundData = SOUND_MANIFEST.SIZE * loadedCount / totalCount
                                @_updateProgressBar()

                                if loadedCount == totalCount
                                    latch.step()

            SM2.setup
                url: "./swf/"
                flashVersion: 9
                onready: createSounds

        _updateProgressBar: ->
            loadedProportion = (@_loadedImageData + @_loadedSoundData) / (IMAGE_MANIFEST.SIZE + SOUND_MANIFEST.SIZE)
            @_plumber.setX PLUMBER_INITIAL_X + (PLUMBER_FINAL_X - PLUMBER_INITIAL_X) * loadedProportion
            @redraw()

        _loadComplete: =>
            @_game.switchScreen @, new MainScreen @_game

        _constructInputEvents: (inputController) ->

        _destroyInputEvents: (inputController) ->


    return LoadingScreen