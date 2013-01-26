define [
    "box2D"
    "model/physics/physicalEntity"
], (Box2D, PhysicalEntity) ->

    class Surface extends PhysicalEntity

        constructor: (physicalWorld, width, height, weight) ->
            super physicalWorld, Box2D.Dynamics.b2BodyDef.b2_staticBody, width, height, weight


    return Surface