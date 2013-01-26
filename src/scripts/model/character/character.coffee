define [
    "box2D"
    "model/constants"
    "model/physics/physicalEntity"
    "model/character/regular/standingRegularCharacterState"
    "model/character/captured/capturedCharacterState"
], (Box2D, Constants, PhysicalEntity, StandingRegularCharacterState, CapturedCharacterState) ->

    {CHARACTER} = Constants

    class Character extends PhysicalEntity

        constructor: (physicalWorld) ->
            super physicalWorld, Box2D.Dynamics.b2Body.b2_dynamicBody, CHARACTER.width, CHARACTER.height, CHARACTER.weight

            @setState new StandingRegularCharacterState
            @_heartRate = CHARACTER.regularHeartBeat

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
            console.log ">>> State: " + @_state.constructor.name + " <<<"

        getImageName: ->
            @_state.getImageName()

        update: (deltaTime) ->
            @_state.update @, deltaTime

        move: (direction) ->
            @_state.move @, direction

        stop: ->
            @_state.stop @

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