define [], () ->

    class CharacterState

        # Abstract
        getImageName: ->
            throw new Error "Cannot invoke abstract method CharacterState.getImageName()."

        # Abstract
        update: (character, deltaTime) ->
            throw new Error "Cannot invoke abstract method CharacterState.update(character, deltaTime)."

        # Abstract
        move: (character, direction) ->
            throw new Error "Cannot invoke abstract method CharacterState.move(character, direction)."

        stop: ->
            # Do nothing

        # Abstract
        crouch: (character) ->
            throw new Error "Cannot invoke abstract method CharacterState.crouch(character)."

        # Abstract
        jump: (character) ->
            throw new Error "Cannot invoke abstract method CharacterState.jump(character)."

        # Abstract
        warmLeft: (character) ->
            throw new Error "Cannot invoke abstract method CharacterState.warmLeft(character)."

        # Abstract
        warmRight: (character) ->
            throw new Error "Cannot invoke abstract method CharacterState.warmRight(character)."

        isCaptured: ->
            false


    return CharacterState