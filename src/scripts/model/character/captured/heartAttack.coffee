define [
    "model/character/captured/captured"
], (Captured) ->

    class HeartAttack extends Captured

        _getPulse: ->
            "heartAttack"

        _getSpriteWidth: ->
            343

        _getSpriteHeight: ->
            322

        _getNumberOfSpritesheetFrames: ->
            1

        _getSpritesheetFrameRate: ->
            1

        isHeartStopped: ->
            true


    return HeartAttack