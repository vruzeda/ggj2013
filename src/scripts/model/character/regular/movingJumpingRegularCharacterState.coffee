define [
    "model/constants"
    "model/character/characterState"
], (Constants, CharacterState) ->

    {SPEEDS} = Constants

    class MovingJumpingRegularCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()
            @_falling = false

        getImageName: ->
            "jumpingRegularCharacter"

        update: (character, deltaTime) ->
            position = character.getPosition()
            deltaX = SPEEDS.walking * deltaTime / 1000

            if @_direction == "right"
                character.setPosition x: position.x + deltaX, y: position.y
            else
                character.setPosition x: position.x - deltaX, y: position.y

            speed = character.getSpeed()

            if speed.x == 0
                JumpingRegularCharacterState = require "model/character/regular/jumpingRegularCharacterState"
                character.setState new JumpingRegularCharacterState
            else if not @_falling
                @_falling = speed.y >= 0
            else if speed.y == 0
                WalkingRegularCharacterState = require "model/character/regular/walkingRegularCharacterState"
                character.setState new WalkingRegularCharacterState @_direction

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        stop: (character) ->
            JumpingRegularCharacterState = require "model/character/regular/jumpingRegularCharacterState"
            character.setState new JumpingRegularCharacterState

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return MovingJumpingRegularCharacterState