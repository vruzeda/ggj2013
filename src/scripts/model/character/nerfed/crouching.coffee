define [
    "model/character/nerfed/basePulse"
], (BasePulse) ->

    class Crouching extends BasePulse

        _getState: ->
            "crouching"

        _getSpriteWidth: ->
            343

        _getSpriteHeight: ->
            195

        _getNumberOfSpritesheetFrames: ->
            1

        _getSpritesheetFrameRate: ->
            1

        isCrouching: ->
            true


    return Crouching