define [
    "model/character/pumped/basePulse"
], (BasePulse) ->

    class WarmingLeft extends BasePulse

        _getState: ->
            "warmingLeft"

        _getSpriteWidth: ->
            686

        _getSpriteHeight: ->
            643

        _getSpritesheetFrames: ->
            [0]

        _getSpritesheetFrameRate: ->
            1

        isWarming: ->
            true


    return WarmingLeft