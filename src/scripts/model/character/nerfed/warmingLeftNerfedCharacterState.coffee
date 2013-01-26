define [
    "model/character/characterState"
    "model/character/nerfed/standingNerfedCharacterState"
    "model/character/nerfed/warmingRightNerfedCharacterState"
], (CharacterState, StandingNerfedCharacterState, WarmingRightNerfedCharacterState) ->

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
            character.setState new WarmingRightNerfedCharacterState

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingNerfedCharacterState


    return WarmingLeftNerfedCharacterState