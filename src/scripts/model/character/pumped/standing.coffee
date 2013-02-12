define [
    "model/character/pumped/basePulse"
], (BasePulse) ->

    class Standing extends BasePulse

        _getState: ->
            "standing"

        _getSpriteWidth: ->
            384

        _getSpriteHeight: ->
            384

        _getSpritesheetFrames: ->
            [0..14]

        _getSpritesheetFrameRate: ->
            30

        isStanding: ->
            true


    return Standing