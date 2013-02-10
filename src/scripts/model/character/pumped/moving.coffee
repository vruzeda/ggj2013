define [
    "model/character/pumped/basePulse"
], (BasePulse) ->

    class Moving extends BasePulse

        _getState: ->
            "moving"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getNumberOfSpritesheetFrames: ->
            15

        _getSpritesheetFrameRate: ->
            10

        isMoving: ->
            true


    return Moving