define [
    "model/character/characterState"
    "model/character/pumped/standingPumpedCharacterState"
    "model/character/pumped/warmingLeftPumpedCharacterState"
], (CharacterState, StandingPumpedCharacterState, WarmingLeftPumpedCharacterState) ->

    class WarmingRightPumpedCharacterState extends CharacterState

        getImageName: ->
            "warmingRightPumpedCharacterState"

        crouch: (character) ->
            @_goBackToStandingState character

        jump: (character) ->
            @_goBackToStandingState character

        warmLeft: (character) ->
            character.setState new WarmingLeftPumpedCharacterState

        warmRight: (character) ->
            @_goBackToStandingState character

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingPumpedCharacterState


    return WarmingRightPumpedCharacterState