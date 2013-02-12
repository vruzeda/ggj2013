define [
    "model/character/nerfed/basePulse"
], (BasePulse) ->

    class Crouching extends BasePulse

        _getState: ->
            "crouching"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..14]

        _getSpritesheetFrameRate: ->
            30

        isCrouching: ->
            true


    return Crouching