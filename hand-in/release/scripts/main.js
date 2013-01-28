(function() {

  require.config({
    urlArgs: "bust=" + new Date,
    paths: {
      jquery: "lib/src/jquery-1.9.0",
      kinetic: "lib/src/kinetic-v4.3.0"
    }
  });

  require(["jquery", "heartGame", "model/constants"], function($, HeartGame, Constants) {
    var GAME_RESOLUTION;
    GAME_RESOLUTION = Constants.GAME_RESOLUTION;
    $("#container").focus();
    return new HeartGame("container", GAME_RESOLUTION.width, GAME_RESOLUTION.height);
  });

}).call(this);
