define [
    "model/character/characterState"
    "model/character/pumped/jumpingPumpedCharacterState"
], (CharacterState, JumpingPumpedCharacterState) ->

    class WalkingPumpedCharacterState extends CharacterState

        getImageName: ->
            "walkingPumpedCharacterState"

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new JumpingPumpedCharacterState

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingPumpedCharacterState