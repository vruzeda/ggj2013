define [
    "model/character/characterState"
    "model/character/nerfed/movingCrouchingNerfedCharacterState"
], (CharacterState) ->

    class CrouchingNerfedCharacterState extends CharacterState

        getImageName: ->
            "crouchingNerfedCharacter"

        update: (character, deltaTime) ->
            # positions

        move: (character, direction) ->
            character.setState new MovingCrouchingNerfedCharacterState @_direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return CrouchingNerfedCharacterState