define [
    "model/constants"
    "model/character/character"
    "model/surface/table"
    "model/surface/ceil"
    "model/surface/mediumObstacle"
    "model/surface/becker"
    "model/surface/books"
    "model/surface/bookPile"
    "model/surface/bureta"
    "model/surface/tubes"
    "model/surface/frascoTripe"
    "model/surface/windowBase"
    "model/decoration/microscope"
    "model/decoration/scientist"
    "model/decoration/tubesStructure"
    "model/decoration/tripe"
    "model/decoration/support"
    "model/decoration/locker"
    "model/decoration/endingWindow"
    "model/decoration/light"
], (Constants, Character, Table, Ceil, MediumObstacle, Becker, Books, BookPile, Bureta, Tubes, FrascoTripe, WindowBase, Microscope, Scientist, TubesStructure, Tripe, Support, Locker, EndingWindow, Light) ->

    {CHARACTER, TABLE, CEIL, SCIENTIST, GAME, WORLD, GAME_RESOLUTION} = Constants

    class World

        constructor: (@_gravity, @_width, @_height) ->
            @_character = new Character
            @_character.setPosition x: CHARACTER.x, y: CHARACTER.y

            @_surfaces = []
            @_decorations = []
            @_frontDecorations = []

            # create tables
            for i in [0..6]
                table = new Table
                table.setPosition x: TABLE.x + i*TABLE.width, y: TABLE.y
                @_surfaces.push table
                ceil = new Ceil
                ceil.setPosition x: TABLE.x + i*CEIL.width, y: CEIL.y
                @_surfaces.push ceil

            @_scientist = new Scientist
            @_scientist.setPosition x: SCIENTIST.x, y: SCIENTIST.y
            @_decorations.push @_scientist

            locker = new Locker
            locker.setPosition x: -330, y: 0
            @_surfaces.push locker

            endingWindow = new EndingWindow
            endingWindow.setPosition x: WORLD.endOfGame + 880, y: 0
            @_decorations.push endingWindow

            windowBase = new WindowBase # placeholder for microscopio
            windowBase.setPosition x: WORLD.endOfGame + 1210, y: 330
            @_surfaces.push windowBase

            light = new Light
            light.setPosition x: WORLD.endOfGame + 625, y: 40
            @_frontDecorations.push light

            becker = new Becker
            becker.setPosition x: 600, y: TABLE.y - 180
            @_surfaces.push becker
            lastPosition = 600

            books = new Books # placeholder for microscopio
            books.setPosition x: lastPosition + 600, y: TABLE.y - 180
            @_surfaces.push books
            lastPosition += 600

            bookPile = new BookPile
            bookPile.setPosition x: lastPosition + 1150, y: TABLE.y - 360
            @_surfaces.push bookPile
            lastPosition += 1150

            books3 = new Books
            books3.setPosition x: lastPosition + 1230, y: TABLE.y - 180
            @_surfaces.push books3
            lastPosition += 1230

            tripe = new Tripe
            tripe.setPosition x: lastPosition + 1180, y: TABLE.y - 180
            @_frontDecorations.push tripe

            frascoTripe = new FrascoTripe
            frascoTripe.setPosition x: lastPosition + 1200, y: TABLE.y - 620
            @_surfaces.push frascoTripe
            lastPosition += 1200

            bureta = new Bureta
            bureta.setPosition x: lastPosition + 1000, y: TABLE.y - 360
            @_surfaces.push bureta
            lastPosition += 1000

            bureta2 = new Bureta
            bureta2.setPosition x: lastPosition + 1000, y: TABLE.y - 360
            @_surfaces.push bureta2
            lastPosition += 1000

            support = new Support
            support.setPosition x: lastPosition + 600, y: TABLE.y - 550
            @_decorations.push support

            becker2 = new Becker
            becker2.setPosition x: lastPosition + 600, y: TABLE.y - 310
            @_surfaces.push becker2
            lastPosition += 600

            becker3 = new Becker
            becker3.setPosition x: lastPosition, y: TABLE.y - 485
            @_surfaces.push becker3

            books6 = new Books # placeholder for microscope
            books6.setPosition x: lastPosition + 600, y: TABLE.y - 180
            @_surfaces.push books6
            lastPosition += 600

            tubeStructure = new TubesStructure
            tubeStructure.setPosition x: lastPosition + 900, y: TABLE.y - 360
            @_decorations.push tubeStructure

            tubes = new Tubes
            tubes.setPosition x: lastPosition + 900, y: TABLE.y - 370
            @_surfaces.push tubes
            lastPosition += 900

            becker4 = new Becker
            becker4.setPosition x: lastPosition + 800, y: TABLE.y - 180
            @_surfaces.push becker4
            lastPosition += 800

            support2 = new Support
            support2.setPosition x: lastPosition + 600, y: TABLE.y - 550
            @_decorations.push support2

            becker5 = new Becker # falta colocar o support aqui
            becker5.setPosition x: lastPosition + 600, y: TABLE.y - 310
            @_surfaces.push becker5
            lastPosition += 600

            becker6 = new Becker # falta colocar o support aqui
            becker6.setPosition x: lastPosition, y: TABLE.y - 485
            @_surfaces.push becker6

            bookPile2 = new BookPile
            bookPile2.setPosition x: lastPosition + 1150, y: TABLE.y - 360
            @_surfaces.push bookPile2
            lastPosition += 1150

            bureta3 = new Bureta
            bureta3.setPosition x: lastPosition + 800, y: TABLE.y - 360
            @_surfaces.push bureta3
            lastPosition += 700

            tripe2 = new Tripe
            tripe2.setPosition x: lastPosition + 580, y: TABLE.y - 180
            @_frontDecorations.push tripe2

            frascoTripe2 = new FrascoTripe
            frascoTripe2.setPosition x: lastPosition + 600, y: TABLE.y - 620
            @_surfaces.push frascoTripe2
            lastPosition += 600

            tubeStructure2 = new TubesStructure
            tubeStructure2.setPosition x: lastPosition + 900, y: TABLE.y - 360
            @_decorations.push tubeStructure2

            tubes2 = new Tubes
            tubes2.setPosition x: lastPosition + 900, y: TABLE.y - 360
            @_surfaces.push tubes2
            lastPosition += 900

            microscope = new Microscope
            microscope.setPosition x: 100, y: TABLE.y - 540
            @_decorations.push microscope

        update: (deltaTime) ->
            deltaTimeInSeconds = deltaTime / 1000

            speed = @_character.getSpeed()
            speed.y += @_gravity * deltaTimeInSeconds

            delta =
                x: speed.x * deltaTimeInSeconds
                y: speed.y * deltaTimeInSeconds

            newDelta =
                x: delta.x
                y: delta.y

            if @_character.direction is "left"
                for surface in @_surfaces
                    newDelta.x = @_character.collidesLeftWith surface, delta.x
                    if newDelta.x != delta.x
                        @_character.stop()
                        break

            else if @_character.direction is "right"
                for surface in @_surfaces
                    newDelta.x = @_character.collidesRightWith surface, delta.x
                    if newDelta.x != delta.x
                        @_character.stop()
                        break

            # Jumping
            if @_character.isJumping()
                for surface in @_surfaces
                    newDelta.y = @_character.collidesTopWith surface, delta.y
                    if newDelta.y != delta.y
                        speed.y = 0
                        break

            # Falling or standing
            else
                for surface in @_surfaces
                    newDelta.y = @_character.collidesBottomWith surface, delta.y
                    if newDelta.y != delta.y
                        speed.y = 0
                        break

            @_character.moveBy newDelta
            @_character.setSpeed speed
            @_character.update deltaTime
            @_scientist.update deltaTimeInSeconds

            charPos = @_character.getPosition()
            scientistPos = @_scientist.getPosition()

            if charPos.x >= WORLD.gameWin
                console.log "win!"
            if charPos.x <= scientistPos.x + (SCIENTIST.width/3)
                console.log "dead"

        crouchCharacter: ->
            @_character.crouch()

        raiseCharacter: ->
            @_character.raise()

            for surface in @_surfaces
                collided = @_character.collidesTopWith(surface, 0) != 0
                if collided
                    @_character.crouch()
                    setTimeout =>
                        @raiseCharacter()
                    , 1

        getCharacter: ->
            @_character

        getSurfaces: ->
            @_surfaces

        getDecorations: ->
            @_decorations

        getFrontDecorations: ->
            @_frontDecorations


    return World