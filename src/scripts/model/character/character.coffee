define [
    "model/character/regular/standingRegularCharacterState"
], (StandingRegularCharacterState) ->

    class Character

        constructor: ->
            @_state = new StandingRegularCharacterState

        getImageName: ->
            @_state.getImageName()

        crouch: ->
            @_state.crouch @

        jump: ->
            @_state.jump @

        warmLeft: ->
            @_state.warmLeft @

        warmRight: ->
            @_state.warmRight @


    return Character