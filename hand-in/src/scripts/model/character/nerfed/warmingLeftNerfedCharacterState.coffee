define [
    "model/character/characterState"
], (CharacterState) ->

    class WarmingLeftNerfedCharacterState extends CharacterState

        getImageName: ->
            "warmingLeftNerfedCharacter"

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
            WarmingRightNerfedCharacterState = require "model/character/nerfed/warmingRightNerfedCharacterState"
            character.setState new WarmingRightNerfedCharacterState

        # Noob
        _goBackToStandingState: (character) ->
            StandingNerfedCharacterState = require "model/character/nerfed/standingNerfedCharacterState"
            character.setState new StandingNerfedCharacterState


    return WarmingLeftNerfedCharacterState