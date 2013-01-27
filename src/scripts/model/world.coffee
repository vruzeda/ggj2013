define [
    "model/constants"
    "model/character/character"
    "model/surface/table"
], (Constants, Character, Table) ->

    {CHARACTER, TABLE} = Constants

    class World

        constructor: (@_gravity, @_width, @_height) ->
            @_character = new Character
            @_character.setPosition x: CHARACTER.x, y: CHARACTER.y

            # TODO Actually create a way to build the world
            table = new Table
            table.setPosition x: TABLE.x, y: TABLE.y

            @_surfaces = []
            @_surfaces.push table

        update: (deltaTime) ->
            deltaTimeInSeconds = deltaTime / 1000

            speed = @_character.getSpeed()
            speed.y += @_gravity * deltaTimeInSeconds

            delta =
                x: speed.x * deltaTimeInSeconds
                y: speed.y * deltaTimeInSeconds

            for surface in @_surfaces
                collidedDelta = @_character.collidesWith surface, delta

                if collidedDelta.y isnt delta.y
                    speed.y = 0
                    delta.y = collidedDelta.y
                    continue if not @_character.isInMidAir()

                if collidedDelta.x isnt delta.x
                    speed.x = 0
                    delta.x = collidedDelta.x

            @_character.moveBy delta
            @_character.setSpeed speed
            @_character.update deltaTime

        getCharacter: ->
            @_character

        getSurfaces: ->
            @_surfaces


    return World