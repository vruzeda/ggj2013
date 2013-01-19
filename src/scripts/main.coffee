require.config
    paths:
        kinetic: "lib/kinetic-v4.3.0"

require [
    "simpleGame"
], (SimpleGame) ->

    new SimpleGame("container")