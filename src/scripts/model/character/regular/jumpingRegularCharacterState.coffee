define [
    "model/character/characterState"
    "model/character/regular/movingJumpingRegularCharacterState"
], (CharacterState, MovingJumpingRegularCharacterState) ->

    class JumpingRegularCharacterState extends CharacterState

        constructor: ->
            @_falling = false

        getImageName: ->
            "jumpingRegularCharacter"

        update: (character, deltaTime) ->
            speed = character.getSpeed()

            if not @_falling
                @_falling = speed.y >= 0
            else if speed.y == 0
                StandingRegularCharacterState = require "model/character/regular/standingRegularCharacterState"
                character.setState new StandingRegularCharacterState

        move: (character, direction) ->
            deltaSpeedX = if direction is "left" then -SPEEDS.regular else SPEEDS.regular

            speed = character.getSpeed()
            character.setSpeed x: speed.x + deltaSpeedX, y: speed.y
            character.setState new MovingJumpingRegularCharacterState direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return JumpingRegularCharacterState