define [
    "box2D"
], (Box2D) ->

    class PhysicalEntity

        constructor: (@_physicalWorld, bodyType, @_width, @_height, @_weight) ->
            debugger
            @_bodyDef = new Box2D.Dynamics.b2BodyDef
            @_bodyDef.type = bodyType
            @_bodyDef.active = true
            @_bodyDef.allowSleep = true
            @_bodyDef.fixedRotation = true
            @_bodyDef.gravityScale = 1
            @_bodyDef.linearDamping = 0.0

            @_body = @_physicalWorld.CreateBody @_bodyDef
            @_body.SetUserData @

            if @_weight?
                @_massData = new Box2D.Collision.Shapes.b2MassData
                @_massData.mass = @_weight
                @_body.SetMassData @_massData

            @_shape = new Box2D.Collision.Shapes.b2PolygonShape
            @_shape.SetAsBox @_width / 2, @_height / 2

            @_fixtureDef = new Box2D.Dynamics.b2FixtureDef
            @_fixtureDef.friction = 0
            @_fixtureDef.restitution = 0
            @_fixtureDef.shape = @_shape

            @_fixture = @_body.CreateFixture @_fixtureDef

        destructor: ->
            @_physicalWorld.DestroyBody @_body

        getPosition: ->
            centerOfMass = @getCenterOfMass()
            centerOfMass.x -= @_width / 2
            centerOfMass.y -= @_height / 2
            centerOfMass

        setPosition: (position) ->
            centerOfMass =
                x: position.x + @_width / 2
                y: position.y + @_height / 2
            this.setCenterOfMass centerOfMass

        getCenterOfMass: ->
            @_body.GetWorldCenter()

        setCenterOfMass: (centerOfMass) ->
            @_body.SetTransform centerOfMass.x, centerOfMass.y, 0

        # Abstract
        getImageName: ->
            throw new Error "Cannot invoke abstract method PhysicalEntity.getImageName()."


    return PhysicalEntity