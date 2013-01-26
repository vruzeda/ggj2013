define [
    "model/character/characterState"
    "model/character/pumped/standingPumpedCharacterState"
    "model/character/pumped/warmingRightPumpedCharacterState"
], (CharacterState, StandingPumpedCharacterState, WarmingRightPumpedCharacterState) ->

    class WarmingLeftPumpedCharacterState extends CharacterState

        getImageName: ->
            "warmingLeftPumpedCharacterState"

        crouch: (character) ->
            @_goBackToStandingState character

        jump: (character) ->
            @_goBackToStandingState character

        warmLeft: (character) ->
            @_goBackToStandingState character

        warmRight: (character) ->
            character.setState new WarmingRightPumpedCharacterState

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingPumpedCharacterState


    return WarmingLeftPumpedCharacterState