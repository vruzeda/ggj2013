define [
    "model/constants"
    "model/physics/physicalEntity"
], (Constants, PhysicalEntity) ->

    {CHARACTER} = Constants

    class Character extends PhysicalEntity

        constructor: ->
            super CHARACTER.width, CHARACTER.height
            @_heartRate = CHARACTER.regularHeartBeat

            @setState "standing"
            @setPulse "regular"

        resetHeartBeat: ->
            @_heartRate = CHARACTER["#{@_state}Beat"]

        increaseHeartBeat: ->
            @_heartRate += CHARACTER.heartRaiseIncrement

            if @_heartRate >= CHARACTER.heartAttack
                @setState "captured"
                @setPulse "heartAttack"

            else if @_heartRate >= CHARACTER.pumpedHeartBeat
                @setPulse "pumped"

            else if @_heartRate >= CHARACTER.regularHeartBeat
                @setPulse "regular"

        decreaseHeartBeat: (deltaTime)->
            @_heartRate -= CHARACTER.heartRaiseDecrementByTime * deltaTime

            if @_heartRate <= CHARACTER.cardiacArrest
                @setState "captured"
                @setPulse "cardiacArrest"

            else if @_heartRate <= CHARACTER.nerfedHeartBeat
                @setPulse "nerfed"

            else if @_heartRate <= CHARACTER.regularHeartBeat
                @setPulse "regular"

        setPulse: (@_pulse) ->
            console.debug "Pulse: #{@_pulse}"

        setState: (@_state) ->
            console.debug "State: #{@_state}"

        getImageName: ->
            "#{@_state}_#{@_pulse}"

        update: (deltaTime) ->
            speed = @getSpeed()

            if speed.x == 0
                @stop()

            if speed.y == 0
                @fall()

            else if speed.y > 0
                @falling()

        move: (direction) ->
            switch @_state
                when "standing"  then @setState "moving"
                when "jumping"   then @setState "movingJumping"
                when "falling"   then @setState "movingFalling"
                when "crouching" then @setState "movingCrouching"
                else return

            @direction = direction
            speedX = CHARACTER["#{@_pulse}MoveSpeed"]
            speedX = -CHARACTER["#{@_pulse}MoveSpeed"] if direction is "left"

            speed = @getSpeed()
            @setSpeed x: speedX, y: speed.y

        stop: ->
            switch @_state
                when "moving"          then @setState "standing"
                when "movingJumping"   then @setState "jumping"
                when "movingFalling"   then @setState "falling"
                when "movingCrouching" then @setState "crouching"
                else return

            speed = @getSpeed()
            @setSpeed x: 0, y: speed.y

        crouch: ->
            if @_pulse is "nerfed"
                @setState "crouching"

        jump: ->
            if @_pulse isnt "nerfed" and not @isInMidAir()
                @setState "jumping"

                speed = @getSpeed()
                @setSpeed x: speed.x, y: -CHARACTER["#{@_pulse}JumpSpeed"]

        falling: ->
            if @_state isnt "falling"
                @setState "falling"

        fall: ->
            if @isInMidAir()
                @setState "standing"

                speed = @getSpeed()
                @setSpeed x: speed.x, y: 0

        warmLeft: ->
            if @_state is "standing"
                @setState "warmingLeft"

            else if @_state is "warmingRight"
                @increaseHeartBeat()
                @setState "warmingLeft"

            else
                @unwarm()

        warmRight: ->
            if @_state is "standing"
                @setState "warmingRight"

            else if @_state is "warmingLeft"
                @increaseHeartBeat()
                @setState "warmingRight"

            else
                @unwarm()

        unwarm: ->
            @resetHeartBeat()
            @setState "standing"

        isInMidAir: ->
            @_state is "jumping" or @_state is "movingJumping" or @_state is "falling" or @_state is "movingFalling"

        isJumping: ->
            @_state is "jumping" or @_state is "movingJumping"

        isCaptured: ->
            @_state is "captured"


    return Character