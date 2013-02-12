define [
    "model/character/regular/basePulse"
], (BasePulse) ->

    class Falling extends BasePulse

        _getState: ->
            "falling"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [7..0]

        _getSpritesheetFrameRate: ->
            10

        isFalling: ->
            true


    return Falling