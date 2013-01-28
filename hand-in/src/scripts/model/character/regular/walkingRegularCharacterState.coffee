define [
    "model/constants"
    "model/character/characterState"
    "model/character/regular/movingJumpingRegularCharacterState"
], (Constants, CharacterState, MovingJumpingRegularCharacterState) ->

    {SPEEDS, JUMP_SPEEDS} = Constants

    class WalkingRegularCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        update: (character, deltaTime) ->
            speed = character.getSpeed()

            if speed.x == 0
                StandingRegularCharacterState = require "model/character/regular/standingRegularCharacterState"
                character.setState new StandingRegularCharacterState

        getImageName: ->
            "walkingRegularCharacter"

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        stop: (character) ->
            StandingRegularCharacterState = require "model/character/regular/standingRegularCharacterState"
            character.setState new StandingRegularCharacterState

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            speed = character.getSpeed()
            character.setSpeed x: speed.x, y: speed.y - JUMP_SPEEDS.regular
            character.setState new MovingJumpingRegularCharacterState @_direction

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingRegularCharacterState