define [
    "model/character/characterState"
    "model/character/jumpingRegularCharacterState"
], (CharacterState, JumpingRegularCharacterState) ->

    class WalkingRegularCharacterState extends CharacterState

        getImageName: ->
            "walkingRegularCharacter"

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new JumpingRegularCharacterState

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingRegularCharacterState