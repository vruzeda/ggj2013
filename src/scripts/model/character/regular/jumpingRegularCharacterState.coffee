define [
    "model/character/characterState"
    "model/character/regular/movingJumpingRegularCharacterState"
], (CharacterState, MovingJumpingRegularCharacterState) ->

    class JumpingRegularCharacterState extends CharacterState

        getImageName: ->
            "jumpingRegularCharacter"

        move: (character, direction) ->
            character.setState new MovingJumpingRegularCharacterState @_direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return JumpingRegularCharacterState