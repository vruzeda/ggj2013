define [
    "model/constants"
    "model/character/characterState"
    "model/character/regular/jumpingRegularCharacterState"
    "model/character/regular/walkingRegularCharacterState"
    "model/character/regular/warmingLeftRegularCharacterState"
    "model/character/regular/warmingRightRegularCharacterState"
], (Constants, CharacterState, JumpingRegularCharacterState, WalkingRegularCharacterState, WarmingLeftRegularCharacterState, WarmingRightRegularCharacterState) ->

    {SPEEDS, JUMP_SPEEDS} = Constants

    class StandingRegularCharacterState extends CharacterState

        getImageName: ->
            "standingRegularCharacter"

        update: (character, deltaTime) ->
            character.decreaseHeartBeat character, deltaTime

        move: (character, direction) ->
            deltaSpeedX = if direction is "left" then -SPEEDS.regular else SPEEDS.regular

            speed = character.getSpeed()
            character.setSpeed x: speed.x + deltaSpeedX, y: speed.y
            character.setState new WalkingRegularCharacterState direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            speed = character.getSpeed()
            character.setSpeed x: speed.x, y: speed.y - JUMP_SPEEDS.regular
            character.setState new JumpingRegularCharacterState

        warmLeft: (character) ->
            character.setState new WarmingLeftRegularCharacterState

        warmRight: (character) ->
            character.setState new WarmingRightRegularCharacterState


    return StandingRegularCharacterState