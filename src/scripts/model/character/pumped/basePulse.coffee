define [
    "model/character/characterState"
], (CharacterState) ->

    class BasePulse extends CharacterState

        _getPulse: ->
            "pumped"

        isHeartPumped: ->
            true


    return BasePulse