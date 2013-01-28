define [
    "model/character/characterState"
], (CharacterState) ->

    class CapturedCharacterState extends CharacterState

        constructor: (@_reason) ->

        getImageName: ->
            @_reason

        update: (character, deltaTime) ->
            # Does nothing

        move: (character, direction) ->
            # Does nothing

        crouch: (character) ->
            # Does nothing

        jump: (character) ->
            # Does nothing

        warmLeft: (character) ->
            # Does nothing

        warmRight: (character) ->
            # Does nothing

        isCaptured: () ->
            true

    return CapturedCharacterState