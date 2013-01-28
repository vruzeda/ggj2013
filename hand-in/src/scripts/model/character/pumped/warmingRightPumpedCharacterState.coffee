define [
    "model/character/characterState"
], (CharacterState) ->

    class WarmingRightPumpedCharacterState extends CharacterState

        getImageName: ->
            "warmingRightPumpedCharacter"

        update: (character, deltaTime) ->
            # positions

        move: (character, direction) ->
            @_goBackToStandingState character

        crouch: (character) ->
            @_goBackToStandingState character

        jump: (character) ->
            @_goBackToStandingState character

        warmLeft: (character) ->
            character.increaseHeartBeat()
            WarmingLeftPumpedCharacterState = require "model/character/pumped/warmingLeftPumpedCharacterState"
            character.setState new WarmingLeftPumpedCharacterState

        warmRight: (character) ->
            @_goBackToStandingState character

        # Noob
        _goBackToStandingState: (character) ->
            StandingPumpedCharacterState = require "model/character/pumped/standingPumpedCharacterState"
            character.setState new StandingPumpedCharacterState


    return WarmingRightPumpedCharacterState