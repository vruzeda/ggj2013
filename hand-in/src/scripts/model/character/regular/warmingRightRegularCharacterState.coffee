define [
    "model/character/characterState"
], (CharacterState) ->

    class WarmingRightRegularCharacterState extends CharacterState

        getImageName: ->
            "warmingRightRegularCharacter"

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
            WarmingLeftRegularCharacterState = require "model/character/regular/warmingLeftRegularCharacterState"
            character.setState new WarmingLeftRegularCharacterState

        warmRight: (character) ->
            @_goBackToStandingState character

        # Noob
        _goBackToStandingState: (character) ->
            StandingRegularCharacterState = require "model/character/regular/standingRegularCharacterState"
            character.setState new StandingRegularCharacterState


    return WarmingRightRegularCharacterState