define [
    "model/character/characterState"
], (CharacterState) ->

    class MovingCrouchingNerfedCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        getImageName: ->
            "crouchingNerfedCharacter"

        update: (character, deltaTime) ->
            # positions

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        stop: (character) ->
            CrouchingNerfedCharacterState = require "model/character/nerfed/crouchingNerfedCharacterState"
            character.setState new CrouchingNerfedCharacterState

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return MovingCrouchingNerfedCharacterState