define [], () ->

    class CharacterState

        constructor: (@_sprite) ->

        start: ->
            @_sprite.start()

        stop: ->
            @_sprite.stop()

        getNode: ->
            @_sprite

        ##################
        # State checkers #
        ##################

        isStanding: ->
            false

        isMoving: ->
            false

        isJumping: ->
            false

        isFalling: ->
            false

        isCrouching: ->
            false

        isWarming: ->
            false

        isCaptured: ->
            false

        ##################
        # Pulse checkers #
        ##################

        isHeartNerfed: ->
            false

        isHeartRegular: ->
            false

        isHeartPumped: ->
            false

        isHeartStoped: ->
            false


    return CharacterState