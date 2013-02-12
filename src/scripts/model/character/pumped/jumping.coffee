define [
    "model/character/pumped/basePulse"
], (BasePulse) ->

    class Jumping extends BasePulse

        _getState: ->
            "jumping"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..7]

        _getSpritesheetFrameRate: ->
            10

        isJumping: ->
            true


    return Jumping