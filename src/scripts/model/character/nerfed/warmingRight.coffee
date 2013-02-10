define [
    "model/character/nerfed/basePulse"
], (BasePulse) ->

    class WarmingRight extends BasePulse

        _getState: ->
            "warmingRight"

        _getSpriteWidth: ->
            686

        _getSpriteHeight: ->
            643

        _getNumberOfSpritesheetFrames: ->
            1

        _getSpritesheetFrameRate: ->
            1

        isWarming: ->
            true


    return WarmingRight