define [
    "model/character/characterState"
], (CharacterState) ->

    class WarmingRightNerfedCharacterState extends CharacterState

        getImageName: ->
            "warmingRightNerfedCharacter"

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
            WarmingLeftNerfedCharacterState = require "model/character/nerfed/warmingLeftNerfedCharacterState"
            character.setState new WarmingLeftNerfedCharacterState

        warmRight: (character) ->
            @_goBackToStandingState character

        # Noob
        _goBackToStandingState: (character) ->
            StandingNerfedCharacterState = require "model/character/nerfed/standingNerfedCharacterState"
            character.setState new StandingNerfedCharacterState


    return WarmingRightNerfedCharacterState