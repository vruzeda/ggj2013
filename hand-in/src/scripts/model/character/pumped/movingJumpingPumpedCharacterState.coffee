define [
    "model/character/characterState"
], (CharacterState) ->

    class MovingJumpingPumpedCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        getImageName: ->
            "jumpingPumpedCharacter"

        update: (character, deltaTime) ->
            # positions

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        stop: (character) ->
            JumpingPumpedCharacterState = require "model/character/pumped/jumpingPumpedCharacterState"
            character.setState new JumpingPumpedCharacterState

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return MovingJumpingPumpedCharacterState