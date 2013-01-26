define [
    "model/character/characterState"
    "model/character/nerfed/crouchingNerfedCharacterState"
    "model/character/nerfed/warmingLeftNerfedCharacterState"
    "model/character/nerfed/warmingRightNerfedCharacterState"
], (CharacterState, CrouchingNerfedCharacterState, WarmingLeftNerfedCharacterState, WarmingRightNerfedCharacterState) ->

    class StandingNerfedCharacterState extends CharacterState

        getImageName: ->
            "standingNerfedCharacterState"

        crouch: (character) ->
            character.setState new CrouchingNerfedCharacterState

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            character.setState new WarmingLeftNerfedCharacterState

        warmRight: (character) ->
            character.setState new WarmingRightNerfedCharacterState


    return StandingNerfedCharacterState