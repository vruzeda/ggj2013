define [
    "model/character/nerfed/crouching"
], (Crouching) ->

    class MovingCrouching extends Crouching

        _getState: ->
            "movingCrouching"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..14]

        _getSpritesheetFrameRate: ->
            10

        isMoving: ->
            true


    return MovingCrouching