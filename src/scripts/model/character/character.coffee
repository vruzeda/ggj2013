define [
    "model/constants"
    "model/character/regular/standingRegularCharacterState"
    "model/character/dead/capturedCharacterState"
], (Constants, StandingRegularCharacterState, CapturedCharacterState) ->

    {CHARACTER} = Constants

    class Character

        constructor: ->
            @_state = new StandingRegularCharacterState
            @_heartRate = CHARACTER.regularHeartBeat  # externalize to constants

        increaseHeartBeat: ->
            @_heartRate += CHARACTER.heartRaiseDelta

            if @_heartRate >= CHARACTER.heartAttack
                @setState new CapturedCharacterState "heartAttack"

            else if @_heartRate >= CHARACTER.pumpedHeartBeat
                @setState new StandingPumpedCharacterState

        decreaseHeartBeat: (deltaTime)->
            @_heartRate -= CHARACTER.heartRaiseDelta * deltaTime

            if @_heartRate <= CHARACTER.cardiacArrest
                @setState new CapturedCharacterState "cardiacArrest"

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

        isDead: ->
            @_state.isDead()

    return Character