define [
    "box2D"
    "model/physics/physicalEntity"
], (Box2D, PhysicalEntity) ->

    class Surface extends PhysicalEntity

        constructor: (physicalWorld, width, height) ->
            super physicalWorld, Box2D.Dynamics.b2Body.b2_staticBody, width, height


    return Surface