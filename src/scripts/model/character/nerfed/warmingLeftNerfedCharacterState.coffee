define [
    "model/character/characterState"
    "model/character/pumped/standingNerfedCharacterState"
    "model/character/pumped/warmingRightNerfedCharacterState"
], (CharacterState, StandingNerfedCharacterState, WarmingRightNerfedCharacterState) ->

    class WarmingLeftNerfedCharacterState extends CharacterState

        getImageName: ->
            "warmingLeftNerfedCharacterState"

        crouch: (character) ->
            @_goBackToStandingState character

        jump: (character) ->
            @_goBackToStandingState character

        warmLeft: (character) ->
            @_goBackToStandingState character

        warmRight: (character) ->
            character.setState new WarmingRightNerfedCharacterState

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingNerfedCharacterState


    return WarmingLeftNerfedCharacterState