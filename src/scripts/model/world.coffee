define [
    "box2D"
    "model/constants"
    "model/character/character"
], (Box2D, Constants, Character) ->

    {WORLD, PHYSICS_PARAMETERS} = Constants

    class World

        constructor: ->
            gravity = new Box2D.Common.Math.b2Vec2 0, WORLD.gravity
            @_world = new Box2D.Dynamics.b2World gravity, true

            @_character = new Character @_world

        update: (deltaTime) ->
            @_world.Step deltaTime, PHYSICS_PARAMETERS.velocityIterations, PHYSICS_PARAMETERS.positionIterations
            @_character.update deltaTime


    return World