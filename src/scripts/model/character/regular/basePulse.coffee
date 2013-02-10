define [
    "model/character/characterState"
], (CharacterState) ->

    class BasePulse extends CharacterState

        _getPulse: ->
            "regular"

        isHeartRegular: ->
            true


    return BasePulse