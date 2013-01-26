define [
    "model/character/characterState"
    "model/character/regular/jumpingRegularCharacterState"
    "model/character/regular/walkingRegularCharacterState"
    "model/character/regular/warmingLeftRegularCharacterState"
    "model/character/regular/warmingRightRegularCharacterState"
], (CharacterState, JumpingRegularCharacterState, WalkingRegularCharacterState, WarmingLeftRegularCharacterState, WarmingRightRegularCharacterState) ->

    class StandingRegularCharacterState extends CharacterState

        getImageName: ->
            "standingRegularCharacter"

        update: (character, deltaTime) ->
            character.decreaseHeartBeat character, deltaTime

        move: (character, direction) ->
            character.setState new WalkingRegularCharacterState direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new JumpingRegularCharacterState

        warmLeft: (character) ->
            character.setState new WarmingLeftRegularCharacterState

        warmRight: (character) ->
            character.setState new WarmingRightRegularCharacterState


    return StandingRegularCharacterState