define [
    "box2D"
    "model/constants"
    "model/character/character"
    "model/surface/table"
], (Box2D, Constants, Character, Table) ->

    {WORLD, PHYSICS_PARAMETERS} = Constants

    class World

        constructor: ->
            gravity = new Box2D.Common.Math.b2Vec2 0, WORLD.gravity
            @_world = new Box2D.Dynamics.b2World gravity, true

            @_character = new Character @_world
            @_surfaces  = []

            # TODO Actually create a way to build the world
            @_surfaces.push new Table @_world

        update: (deltaTime) ->
            @_world.Step deltaTime, PHYSICS_PARAMETERS.velocityIterations, PHYSICS_PARAMETERS.positionIterations
            @_character.update deltaTime

        getCharacter: ->
            @_character

        getSurfaces: ->
            @_surfaces


    return World