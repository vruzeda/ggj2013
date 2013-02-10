define [
    "model/character/nerfed/basePulse"
], (BasePulse) ->

    class Jumping extends BasePulse

        _getState: ->
            "jumping"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getNumberOfSpritesheetFrames: ->
            8

        _getSpritesheetFrameRate: ->
            10

        isJumping: ->
            true


    return Jumping