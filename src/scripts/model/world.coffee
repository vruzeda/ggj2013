define [
    "model/constants"
    "model/character/character"
    "model/surface/table"
    "model/surface/mediumObstacle"
], (Constants, Character, Table, MediumObstacle) ->

    {CHARACTER, TABLE} = Constants

    class World

        constructor: (@_gravity, @_width, @_height) ->
            @_character = new Character
            @_character.setPosition x: CHARACTER.x, y: CHARACTER.y

            # TODO Actually create a way to build the world
            table = new Table
            table.setPosition x: TABLE.x, y: TABLE.y

            book = new MediumObstacle
            book.setPosition x: 300, y: TABLE.y - 200

            book2 = new MediumObstacle
            book2.setPosition x: 500, y: TABLE.y - 200

            book3 = new MediumObstacle
            book3.setPosition x: 500, y: TABLE.y - 400

            @_surfaces = []
            @_surfaces.push table
            @_surfaces.push book
            @_surfaces.push book2
            @_surfaces.push book3

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