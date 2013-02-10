define [
    "model/character/captured/captured"
], (Captured) ->

    class CardiacArrest extends Captured

        _getPulse: ->
            "cardiacArrest"

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


    return CardiacArrest