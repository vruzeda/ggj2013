define [
    "model/character/characterState"
    "model/character/pumped/jumpingPumpedCharacterState"
], (CharacterState, JumpingPumpedCharacterState) ->

    class WalkingPumpedCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        update: (character, deltaTime) ->
            # positions

        getImageName: ->
            "walkingPumpedCharacterState"

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new JumpingPumpedCharacterState

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingPumpedCharacterState