define ->

    class CounterLatch

        constructor: (@steps, @callback) ->
            @_progress = 0

        step: () ->
            if (++@_progress) == @steps
                @callback()

    return CounterLatch