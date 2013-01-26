define [
    "model/constants"
    "model/character/characterState"
    "model/character/regular/movingJumpingRegularCharacterState"
], (Constants, CharacterState, MovingJumpingRegularCharacterState) ->

    {SPEEDS} = Constants

    class WalkingRegularCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        update: (character, deltaTime) ->
            position = character.getPosition()
            if @_direction == "right"
                character.setPosition(x: position.x + SPEEDS.walking * deltaTime / 1000, y: position.y)
            else
                character.setPosition(x: position.x - SPEEDS.walking * deltaTime / 1000, y: position.y)

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
            character.setState new MovingJumpingRegularCharacterState @_direction

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingRegularCharacterState