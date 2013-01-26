define [
    "model/character/characterState"
    "model/character/pumped/standingPumpedCharacterState"
    "model/character/pumped/warmingLeftPumpedCharacterState"
], (CharacterState, StandingPumpedCharacterState, WarmingLeftPumpedCharacterState) ->

    class WarmingRightPumpedCharacterState extends CharacterState

        getImageName: ->
            "warmingRightPumpedCharacterState"

        crouch: (character) ->
            # Noob: Going back to the standing state
            character.setState new StandingPumpedCharacterState

        jump: (character) ->
            # Noob: Going back to the standing state
            character.setState new StandingPumpedCharacterState

        warmLeft: (character) ->
            character.setState new WarmingLeftPumpedCharacterState

        warmRight: (character) ->
            # Noob: Going back to the standing state
            character.setState new StandingPumpedCharacterState


    return WarmingRightPumpedCharacterState