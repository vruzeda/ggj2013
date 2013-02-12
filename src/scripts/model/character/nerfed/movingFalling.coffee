define [
    "model/character/nerfed/falling"
], (Falling) ->

    class MovingFalling extends Falling

        _getState: ->
            "movingFalling"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [7..0]

        _getSpritesheetFrameRate: ->
            10

        isMoving: ->
            true


    return MovingFalling