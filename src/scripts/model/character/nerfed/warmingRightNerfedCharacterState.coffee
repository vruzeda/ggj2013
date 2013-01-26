define [
    "model/character/characterState"
    "model/character/pumped/standingNerfedCharacterState"
    "model/character/pumped/warmingLeftNerfedCharacterState"
], (CharacterState, StandingNerfedCharacterState, WarmingLeftNerfedCharacterState) ->

    class WarmingRightNerfedCharacterState extends CharacterState

        getImageName: ->
            "warmingRightNerfedCharacterState"

        crouch: (character) ->
            @_goBackToStandingState character

        jump: (character) ->
            @_goBackToStandingState character

        warmLeft: (character) ->
            character.setState new WarmingLeftNerfedCharacterState

        warmRight: (character) ->
            @_goBackToStandingState character

        # Noob
        _goBackToStandingState: (character) ->
            character.setState new StandingNerfedCharacterState


    return WarmingRightNerfedCharacterState