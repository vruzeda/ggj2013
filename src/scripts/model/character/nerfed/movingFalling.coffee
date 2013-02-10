define [
    "model/character/nerfed/falling"
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
            1

        isMoving: ->
            true


    return MovingFalling