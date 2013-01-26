define [
    "model/character/characterState"
], (CharacterState) ->

    class JumpingRegularCharacterState extends CharacterState

        getImageName: ->
            "jumpingRegularCharacter"

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return JumpingRegularCharacterState