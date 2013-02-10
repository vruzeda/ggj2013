define [
    "model/character/characterState"
], (CharacterState) ->

    class BasePulse extends CharacterState

        _getPulse: ->
            "nerfed"

        isHeartNerfed: ->
            true


    return BasePulse