define [
    "box2D"
], (Box2D) ->

    class PhysicalEntity

        constructor: (@_physicalWorld, bodyType, width, height, weight) ->
            @_bodyDef = new Box2D.Dynamics.b2BodyDef
            @_bodyDef.type = Box2D.Dynamics.b2BodyDef.b2_staticBody
            @_bodyDef.active = true
            @_bodyDef.allowSleep = true
            @_bodyDef.fixedRotation = true
            @_bodyDef.gravityScale = 1
            @_bodyDef.linearDamping = 0.0

            @_shape = new Box2D.Collision.Shapes.b2PolygonShape
            @_shape.SetAsBox CHARACTER.width / 2, CHARACTER.height / 2

            @_massData = new Box2D.Collision.Shapes.b2MassData
            @_massData.mass = CHARACTER.weight

            @_fixtureDef = new Box2D.Dynamics.b2FixtureDef
            @_fixtureDef.friction = 0
            @_fixtureDef.restitution = 0
            @_fixtureDef.shape = @_shape

            @_body = @_physicalWorld.CreateBody @_bodyDef
            @_fixture = @_body.CreateFixture fixtureDef
            @_body.SetMassData @_massData
            @_body.SetUserData @

        destructor: ->
            @_physicalWorld.DestroyBody @_body


    return PhysicalEntity