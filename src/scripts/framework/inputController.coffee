define [
    "jquery"
], ($) ->

    # Private class
    class InputControllerInstance

        CLICK_EVENTS = ["click", "tap"]

        constructor: (containerId) ->
            @_listeners = {}

            $("##{containerId}").css "outline", "none"
            $("##{containerId}").keydown (event) =>
                char = String.fromCharCode event.keyCode
                if @_listeners[char]?
                    listener event for listener in @_listeners[char]

        ################
        # Mouse events #
        ################

        addClickListener: (node, listener) ->
            for clickEvent in CLICK_EVENTS
                node.on clickEvent, ->
                    listener node

        removeClickListener: (node, listener) ->
            for clickEvent in CLICK_EVENTS
                if node.eventListeners[clickEvent]?
                    listenerIndex = listener in node.eventListeners[clickEvent]
                    if listenerIndex isnt -1
                        node.eventListeners[clickEvent].splice listenerIndex, 1

        removeClickListeners: (node) ->
            for clickEvent in CLICK_EVENTS
                node.off clickEvent

        ###################
        # Keyboard events #
        ###################

        addCharListener: (char, listener) ->
            @_listeners[char] ?= []
            @_listeners[char].push listener

        removeCharListener: (char, listener) ->
            if @_listeners[char]?
                listenerIndex = listener in @_listeners[char]
                if listenerIndex isnt -1
                    @_listeners[char].splice listenerIndex, 1

        removeCharListeners: (char) ->
            if @_listeners[char]?
                while @_listeners[char].length > 0
                    @_listeners[char].pop()

                delete @_listeners[char]

        removeAllCharListeners: ->
            for key of @_listeners
                @removeListenersForChar key



    class InputController

        @_instance = null

        @getInstance: (containerId) ->
            @_instance = new InputControllerInstance containerId unless @_instance?
            @_instance


    return InputController