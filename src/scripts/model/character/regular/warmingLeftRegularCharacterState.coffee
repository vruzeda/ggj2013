define [
    "model/character/characterState"
    "model/character/regular/standingRegularCharacterState"
    "model/character/regular/warmingRightRegularCharacterState"
], (CharacterState, StandingRegularCharacterState, WarmingRightRegularCharacterState) ->

    class WarmingLeftRegularCharacterState extends CharacterState

        getImageName: ->
            "warmingLeftRegularCharacter"

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
            WarmingRightRegularCharacterState = require("model/character/regular/warmingRightRegularCharacterState")
            character.setState new WarmingRightRegularCharacterState

        # Noob
        _goBackToStandingState: (character) ->
            StandingRegularCharacterState = require("model/character/regular/standingRegularCharacterState")
            character.setState new StandingRegularCharacterState


    return WarmingLeftRegularCharacterState