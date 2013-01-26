define [
    "model/character/characterState"
    "model/character/regular/movingJumpingPumpedCharacterState"
], (CharacterState) ->

    class JumpingPumpedCharacterState extends CharacterState

        getImageName: ->
            "jumpingPumpedCharacter"

        move: (character, direction) ->
            character.setState new MovingJumpingPumpedCharacterState @_direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Double Jump? :)

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return JumpingPumpedCharacterState