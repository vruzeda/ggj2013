define [
    "model/character/characterState"
], (CharacterState) ->

    class Captured extends CharacterState

        _getState: ->
            "captured"

        isCaptured: ->
            true


    return Captured