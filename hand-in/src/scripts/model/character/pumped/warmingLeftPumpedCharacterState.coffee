define [
    "model/character/characterState"
], (CharacterState) ->

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
            WarmingRightPumpedCharacterState = require "model/character/pumped/warmingRightPumpedCharacterState"
            character.setState new WarmingRightPumpedCharacterState

        # Noob
        _goBackToStandingState: (character) ->
            StandingPumpedCharacterState = require "model/character/pumped/standingPumpedCharacterState"
            character.setState new StandingPumpedCharacterState


    return WarmingLeftPumpedCharacterState