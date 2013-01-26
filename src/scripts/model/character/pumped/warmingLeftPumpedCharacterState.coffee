define [
    "model/character/characterState"
    "model/character/pumped/standingPumpedCharacterState"
    "model/character/pumped/warmingRightPumpedCharacterState"
], (CharacterState, StandingPumpedCharacterState, WarmingRightPumpedCharacterState) ->

    class WarmingLeftPumpedCharacterState extends CharacterState

        getImageName: ->
            "warmingLeftPumpedCharacter"

        update: (character, deltaTime) ->
            # positions

        move: (character, direction) ->
            @_goBackToStandingState character

        crouch: (character) ->
            @_goBackToStandingState character

        jump: (character) ->
            @_goBackToStandingState character

        warmLeft: (character) ->
            @_goBackToStandingState character

        warmRight: (character) ->
            character.increaseHeartBeat()
            character.setState new WarmingRightPumpedCharacterState

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingPumpedCharacterState


    return WarmingLeftPumpedCharacterState