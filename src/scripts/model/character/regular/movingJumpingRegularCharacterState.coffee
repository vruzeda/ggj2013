define [
    "model/character/characterState"
], (CharacterState) ->

    class MovingJumpingRegularCharacterState extends CharacterState

        constructor: (@_direction) ->
            super()

        getImageName: ->
            "jumpingRegularCharacter"

        move: (character, direction) ->
            if @_direction isnt direction
                @_direction = direction

        crouch: (character) ->
            # Can't crouch!

        jump: (character) ->
            # Can't Jump!

        warmLeft: (character) ->
            # Can't warm!

        warmRight: (character) ->
            # Can't warm!


    return MovingJumpingRegularCharacterState