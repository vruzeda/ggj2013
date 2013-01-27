define [
    "model/constants"
    "model/character/character"
    "model/surface/table"
    "model/surface/mediumObstacle"
    "model/surface/becker"
    "model/surface/books"
    "model/surface/bookPile"
    "model/surface/bureta"
    "model/surface/tubes"
], (Constants, Character, Table, MediumObstacle, Becker, Books, BookPile, Bureta, Tubes) ->

    {CHARACTER, TABLE} = Constants

    class World

        constructor: (@_gravity, @_width, @_height) ->
            @_character = new Character
            @_character.setPosition x: CHARACTER.x, y: CHARACTER.y

            @_surfaces = []

            # create tables
            for i in [0..11]
                table = new Table
                table.setPosition x: TABLE.x + i*TABLE.width, y: TABLE.y
                @_surfaces.push table

            becker = new Becker
            becker.setPosition x: 600, y: TABLE.y - 180
            @_surfaces.push becker
            lastPosition = 600

            books = new Books # placeholder for microscopio
            books.setPosition x: lastPosition + 600, y: TABLE.y - 180
            @_surfaces.push books
            lastPosition += 600

            books2 = new Books # just for the jump
            books2.setPosition x: lastPosition + 600, y: TABLE.y - 180
            @_surfaces.push books2
            lastPosition += 600

            bookPile = new BookPile
            bookPile.setPosition x: lastPosition + 550, y: TABLE.y - 360
            @_surfaces.push bookPile
            lastPosition += 550

            books3 = new Books
            books3.setPosition x: lastPosition + 1230, y: TABLE.y - 180
            @_surfaces.push books3
            lastPosition += 1230

            books4 = new Books # placeholder for tripé
            books4.setPosition x: lastPosition + 1200, y: TABLE.y - 180
            @_surfaces.push books4
            lastPosition += 1200

            bureta = new Bureta
            bureta.setPosition x: lastPosition + 1000, y: TABLE.y - 360
            @_surfaces.push bureta
            lastPosition += 1000

            books5 = new Books # just for the jump
            books5.setPosition x: lastPosition + 500, y: TABLE.y - 180
            @_surfaces.push books5
            lastPosition += 500

            bureta2 = new Bureta
            bureta2.setPosition x: lastPosition + 500, y: TABLE.y - 360
            @_surfaces.push bureta2
            lastPosition += 500

            becker2 = new Becker # falta colocar o support aqui
            becker2.setPosition x: lastPosition + 600, y: TABLE.y - 360
            @_surfaces.push becker2
            lastPosition += 600

            becker3 = new Becker # falta colocar o support aqui
            becker3.setPosition x: lastPosition, y: TABLE.y - 540
            @_surfaces.push becker3

            books6 = new Books # placeholder for microscope
            books6.setPosition x: lastPosition + 600, y: TABLE.y - 180
            @_surfaces.push books6
            lastPosition += 600

            tubes = new Tubes
            tubes.setPosition x: lastPosition + 900, y: TABLE.y - 360
            @_surfaces.push tubes
            lastPosition += 900

            becker4 = new Becker
            becker4.setPosition x: lastPosition + 800, y: TABLE.y - 180
            @_surfaces.push becker4
            lastPosition += 800

            becker5 = new Becker # falta colocar o support aqui
            becker5.setPosition x: lastPosition + 600, y: TABLE.y - 360
            @_surfaces.push becker5
            lastPosition += 600

            becker6 = new Becker # falta colocar o support aqui
            becker6.setPosition x: lastPosition, y: TABLE.y - 540
            @_surfaces.push becker6

            books7 = new Books # placeholder for microscope
            books7.setPosition x: lastPosition + 500, y: TABLE.y - 180
            @_surfaces.push books7
            lastPosition += 500

            bookPile2 = new BookPile
            bookPile2.setPosition x: lastPosition + 1150, y: TABLE.y - 360
            @_surfaces.push bookPile2
            lastPosition += 1150

            bureta3 = new Bureta
            bureta3.setPosition x: lastPosition + 800, y: TABLE.y - 360
            @_surfaces.push bureta3
            lastPosition += 700

            books8 = new Books # placeholder for tripé
            books8.setPosition x: lastPosition + 600, y: TABLE.y - 180
            @_surfaces.push books8
            lastPosition += 600

            tubes2 = new Tubes
            tubes2.setPosition x: lastPosition + 900, y: TABLE.y - 360
            @_surfaces.push tubes2
            lastPosition += 900

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

        getCharacter: ->
            @_character

        getSurfaces: ->
            @_surfaces


    return World