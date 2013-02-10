define [
    "model/character/nerfed/basePulse"
], (BasePulse) ->

    class Falling extends BasePulse

        _getState: ->
            "falling"

        _getSpriteWidth: ->
            686

        _getSpriteHeight: ->
            643

        _getNumberOfSpritesheetFrames: ->
            1

        _getSpritesheetFrameRate: ->
            1

        isFalling: ->
            true


    return Falling