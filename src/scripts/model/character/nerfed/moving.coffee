define [
    "model/character/nerfed/basePulse"
], (BasePulse) ->

    class Moving extends BasePulse

        _getState: ->
            "moving"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..14]

        _getSpritesheetFrameRate: ->
            10

        _getSoundEffectName: ->
            "move3"

        isMoving: ->
            true


    return Moving