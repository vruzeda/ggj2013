define [], () ->

    class CharacterState

        # Abstract
        getImageName: ->
            throw new Error "Cannot invoke abstract method CharacterState.getImageName()."

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


    return CharacterState