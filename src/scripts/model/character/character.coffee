define [
    "model/constants"
    "model/character/regular/standingRegularCharacterState"
], (Constants, StandingRegularCharacterState) ->

    {CHARACTER} = Constants

    class Character

        constructor: ->
            @_state = new StandingRegularCharacterState
            @_heartRate = CHARACTER.regularHeartBeat  # externalize to constants

        increaseHeartBeat: ->
            @_heartRate += CHARACTER.heartRaiseDelta

            if @_heartRate >= CHARACTER.heartAttack
                # dead

            else if @_heartRate >= CHARACTER.pumpedHeartBeat
                @setState new StandingPumpedCharacterState

        decreaseHeartBeat: (deltaTime)->
            @_heartRate -= CHARACTER.heartRaiseDelta * deltaTime

            if @_heartRate <= CHARACTER.cardiacArrest
                # dead

            else if @_heartRate <= CHARACTER.nerfedHeartBeat
                @setState new StandingNerfedCharacterState

        setState: (@_state) ->

        getImageName: ->
            @_state.getImageName()

        update: (deltaTime) ->
            @_state.update @, deltaTime

        move: (direction) ->
            @_state.move @, direction

        crouch: ->
            @_state.crouch @

        jump: ->
            @_state.jump @

        warmLeft: ->
            @_state.warmLeft @

        warmRight: ->
            @_state.warmRight @

    return Character