define [
    "model/character/regular/basePulse"
], (BasePulse) ->

    class WarmingRight extends BasePulse

        _getState: ->
            "warmingRight"

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


    return WarmingRight