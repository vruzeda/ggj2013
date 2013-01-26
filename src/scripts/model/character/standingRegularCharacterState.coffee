define [
    "model/character/characterState"
], (CharacterState) ->

    class StandingRegularCharacterState extends CharacterState

        getImageName: ->
            "standingRegularCharacter"

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new JumpingRegularCharacterState

        warmLeft: (character) ->
            # character.setState new

        warmRight: (character) ->
            # character.setState new


    return StandingRegularCharacterState