define [
    "model/character/characterState"
], (CharacterState) ->

    class CrouchingNerfedCharacterState extends CharacterState

        getImageName: ->
            "crouchingNerfedCharacter"

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return CrouchingNerfedCharacterState