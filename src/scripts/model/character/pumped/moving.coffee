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

        _getSpritesheetFrames: ->
            [0..14]

        _getSpritesheetFrameRate: ->
            10

        _getSoundEffectName: ->
            "move2"

        isMoving: ->
            true


    return Moving