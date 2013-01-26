define [
    "model/character/characterState"
    "model/character/pumped/standingPumpedCharacterState"
    "model/character/pumped/warmingRightPumpedCharacterState"
], (CharacterState, StandingPumpedCharacterState, WarmingRightPumpedCharacterState) ->

    class WarmingLeftPumpedCharacterState extends CharacterState

        getImageName: ->
            "warmingLeftPumpedCharacterState"

        crouch: (character) ->
            # Noob: Going back to the standing state
            character.setState new StandingPumpedCharacterState

        jump: (character) ->
            # Noob: Going back to the standing state
            character.setState new StandingPumpedCharacterState

        warmLeft: (character) ->
            # Noob: Going back to the standing state
            character.setState new StandingPumpedCharacterState

        warmRight: (character) ->
            character.setState new WarmingRightPumpedCharacterState


    return WarmingLeftPumpedCharacterState