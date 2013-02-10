define [
    "model/character/nerfed/basePulse"
], (BasePulse) ->

    class WarmingLeft extends BasePulse

        _getState: ->
            "warmingLeft"

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


    return WarmingLeft