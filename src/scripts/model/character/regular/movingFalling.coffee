define [
    "model/character/regular/falling"
], (Falling) ->

    class MovingFalling extends Falling

        _getState: ->
            "movingFalling"

        _getSpriteWidth: ->
            686

        _getSpriteHeight: ->
            643

        _getNumberOfSpritesheetFrames: ->
            1

        _getSpritesheetFrameRate: ->
            10

        isMoving: ->
            true


    return MovingFalling