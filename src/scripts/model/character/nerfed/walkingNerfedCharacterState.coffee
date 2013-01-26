define [
    "model/character/characterState"
    "model/character/nerfed/crouchingNerfedCharacterState"
], (CharacterState, crouchingNerfedCharacterState) ->

    class WalkingNerfedCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        update: (character, deltaTime) ->
            # positions

        getImageName: ->
            "walkingNerfedCharacterState"

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        stop: (character) ->
            StandingNerfedCharacterState = require "model/character/nerfed/standingNerfedCharacterState"
            character.setState new StandingNerfedCharacterState

        crouch: (character) ->
            character.setState new CrouchingNerfedCharacterState

        jump: (character) ->
            # can't jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingNerfedCharacterState