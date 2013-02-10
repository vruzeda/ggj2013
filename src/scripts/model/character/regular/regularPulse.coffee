define [
    "model/character/characterState"
], (CharacterState) ->

    class RegularPulse extends CharacterState

        isHeartRegular: ->
            true


    return RegularPulse