define [
    "model/character/characterState"
    "model/character/pumped/crouchingNerfedCharacterState"
], (CharacterState, crouchingNerfedCharacterState) ->

    class WalkingNerfedCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        getImageName: ->
            "walkingNerfedCharacterState"

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        crouch: (character) ->
            character.setState new CrouchingNerfedCharacterState

        jump: (character) ->
            # can't jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingNerfedCharacterState