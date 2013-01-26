define [
    "model/character/characterState"
    "model/character/regular/jumpingRegularCharacterState"
], (CharacterState, JumpingRegularCharacterState) ->

    class WalkingRegularCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        update: (character, deltaTime) ->
            # positions

        getImageName: ->
            "walkingRegularCharacter"

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            character.setState new MovingJumpingRegularCharacterState @_direction

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return WalkingRegularCharacterState