define [
    "model/character/characterState"
    "model/character/nerfed/standingNerfedCharacterState"
    "model/character/nerfed/warmingLeftNerfedCharacterState"
], (CharacterState, StandingNerfedCharacterState, WarmingLeftNerfedCharacterState) ->

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
            character.setState new WarmingLeftNerfedCharacterState

        warmRight: (character) ->
            @_goBackToStandingState character

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingNerfedCharacterState


    return WarmingRightNerfedCharacterState