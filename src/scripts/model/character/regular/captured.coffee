define [
    "model/character/regular/basePulse"
], (BasePulse) ->

    class Captured extends BasePulse

        _getState: ->
            "standing"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getNumberOfSpritesheetFrames: ->
            15

        _getSpritesheetFrameRate: ->
            30

        isCaptured: ->
            true


    return Captured