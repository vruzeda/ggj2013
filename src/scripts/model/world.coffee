define [
    "model/constants"
    "model/character/character"
    "model/surface/table"
    "model/surface/mediumObstacle"
    "model/surface/becker"
    "model/surface/books"
    "model/surface/bookPile"
], (Constants, Character, Table, MediumObstacle, Becker, Books, BookPile) ->

    {CHARACTER, TABLE} = Constants

    class World

        constructor: (@_gravity, @_width, @_height) ->
            @_character = new Character
            @_character.setPosition x: CHARACTER.x, y: CHARACTER.y

            @_surfaces = []

            # create tables
            for i in [0..9]
                table = new Table
                table.setPosition x: TABLE.x + i*TABLE.width, y: TABLE.y
                @_surfaces.push table

            becker = new Becker
            becker.setPosition x: 600, y: TABLE.y - 180
            @_surfaces.push becker

            books = new Books
            books.setPosition x: 1200, y: TABLE.y - 180
            @_surfaces.push books

            books2 = new Books
            books2.setPosition x: 1800, y: TABLE.y - 180
            @_surfaces.push books2

            bookPile = new BookPile
            bookPile.setPosition x: 2350, y: TABLE.y - 360
            @_surfaces.push bookPile

            books3 = new Books
            books3.setPosition x: 2940, y: TABLE.y - 180
            @_surfaces.push books3

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
                        @_character.falling()
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