define [
    "kinetic"
    "sm2"
    "framework/imageLoader"
], (Kinetic, SM2, ImageLoader) ->

    class CharacterState

        constructor: (character) ->
            spritesheet = ImageLoader.getImage @_getSpritesheetName()
            spriteWidth  = @_getSpriteWidth()
            spriteHeight = @_getSpriteHeight()
            columns = spritesheet.width / spriteWidth

            frames = for frameIndex in @_getSpritesheetFrames()
                x = Math.floor frameIndex % columns
                y = Math.floor frameIndex / columns

                x: x * spriteWidth
                y: y * spriteHeight
                width:  spriteWidth
                height: spriteHeight

            frameRate = @_getSpritesheetFrameRate()

            @_characterNode = character.getNode()
            @_characterNode.setAttrs
                image: spritesheet
                animation: "animation"
                animations: animation: frames
                frameRate: frameRate
                scale:
                    x: character.getWidth()  / spriteWidth
                    y: character.getHeight() / spriteHeight

            # TODO Unnecessary validation:
            soundEffectName = @_getSoundEffectName()
            @_soundEffect = SM2.createSound id: soundEffectName if soundEffectName?

        _getSpritesheetName: ->
            "#{@_getPulse()}_#{@_getState()}"

        # Abstract
        _getPulse: ->
            throw new Error "Cannot invoke abstract method CharacterState._getPulse()."

        # Abstract: ->
        _getState: ->
            throw new Error "Cannot invoke abstract method CharacterState._getState()."

        # Abstract
        _getSpriteWidth: ->
            throw new Error "Cannot invoke abstract method CharacterState._getSpriteWidth()."

        # Abstract
        _getSpriteHeight: ->
            throw new Error "Cannot invoke abstract method CharacterState._getSpriteHeight()."

        # Abstract
        _getSpritesheetFrames: ->
            throw new Error "Cannot invoke abstract method CharacterState._getSpritesheetFrames()."

        # Abstract
        _getSpritesheetFrameRate: ->
            throw new Error "Cannot invoke abstract method CharacterState._getSpritesheetFrameRate()."

        # Abstract
        _getSoundEffectName: ->
            # TODO throw new Error "Cannot invoke abstract method CharacterState._getSoundEffectName()."

        start: ->
            unless @_started
                @_characterNode.start()
                @_started = true

                @_playSoundEffect()

        stop: ->
            if @_started
                @_characterNode.stop()
                @_started = false

                @_stopSoundEffect()

        _playSoundEffect: ->
            return unless @_soundEffect?

            @_soundEffect.play onfinish: =>
                @_playSoundEffect()

        _stopSoundEffect: ->
            return unless @_soundEffect?

            @_soundEffect.stop()

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

        isFree: ->
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

        isHeartStopped: ->
            false


    return CharacterState