define [
    "model/character/characterState"
    "model/character/pumped/crouchingNerfedCharacterState"
], (CharacterState, crouchingNerfedCharacterState) ->

    class WalkingNerfedCharacterState extends CharacterState

        getImageName: ->
            "walkingNerfedCharacterState"

        crouch: (character) ->
            character.setState new CrouchingNerfedCharacterState

        jump: (character) ->
            # can't jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingNerfedCharacterState