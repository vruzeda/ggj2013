define [], ->

    class CounterLatch

        constructor: (@_steps, @_callback) ->
            @_progress = 0

        step: ->
            @_progress++

            if @_progress == @_steps
                @_callback()


    return CounterLatch