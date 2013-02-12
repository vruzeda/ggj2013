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

        _getSpritesheetFrames: ->
            [0]

        _getSpritesheetFrameRate: ->
            1

        isHeartStopped: ->
            true


    return CardiacArrest