define [
    "model/character/characterState"
    "model/character/regular/standingRegularCharacterState"
    "model/character/regular/warmingLeftRegularCharacterState"
], (CharacterState, StandingRegularCharacterState, WarmingLeftRegularCharacterState) ->

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
            character.setState new WarmingLeftRegularCharacterState

        warmRight: (character) ->
            @_goBackToStandingState character

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingRegularCharacterState


    return WarmingRightRegularCharacterState