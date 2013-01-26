define [
    "model/character/characterState"
], (CharacterState) ->

    class JumpingPumpedCharacterState extends CharacterState

        getImageName: ->
            "jumpingPumpedCharacter"

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Double Jump? :)

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return JumpingPumpedCharacterState