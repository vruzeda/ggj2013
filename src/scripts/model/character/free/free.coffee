define [
    "model/character/characterState"
], (CharacterState) ->

    class Free extends CharacterState

        _getState: ->
            "free"

        isFree: ->
            true


    return Free