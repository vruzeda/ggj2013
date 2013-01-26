define [
    "model/character/characterState"
    "model/character/nerfed/crouchingNerfedCharacterState"
    "model/character/nerfed/walkingNerfedCharacterState"
    "model/character/nerfed/warmingLeftNerfedCharacterState"
    "model/character/nerfed/warmingRightNerfedCharacterState"
], (CharacterState, CrouchingNerfedCharacterState, WalkingNerfedCharacterState, WarmingLeftNerfedCharacterState, WarmingRightNerfedCharacterState) ->

    class StandingNerfedCharacterState extends CharacterState

        getImageName: ->
            "standingNerfedCharacterState"

        update: (character, deltaTime) ->
            character.decreaseHeartBeat character, deltaTime

        move: (character, direction) ->
            character.setState new WalkingNerfedCharacterState direction

        crouch: (character) ->
            character.setState new CrouchingNerfedCharacterState

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            character.setState new WarmingLeftNerfedCharacterState

        warmRight: (character) ->
            character.setState new WarmingRightNerfedCharacterState


    return StandingNerfedCharacterState