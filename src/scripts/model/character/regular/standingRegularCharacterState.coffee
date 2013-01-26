define [
    "model/character/characterState"
    "model/character/regular/jumpingRegularCharacterState"
    "model/character/regular/warmingLeftRegularCharacterState"
    "model/character/regular/warmingRightRegularCharacterState"
], (CharacterState, JumpingRegularCharacterState, WarmingLeftRegularCharacterState, WarmingRightRegularCharacterState) ->

    class StandingRegularCharacterState extends CharacterState

        getImageName: ->
            "standingRegularCharacter"

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new JumpingRegularCharacterState

        warmLeft: (character) ->
            character.setState new WarmingLeftRegularCharacterState

        warmRight: (character) ->
            character.setState new WarmingRightRegularCharacterState


    return StandingRegularCharacterState