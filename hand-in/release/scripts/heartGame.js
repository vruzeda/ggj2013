(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["framework/game", "screen/splashScreen"], function(Game, SplashScreen) {
    var SimpleGame;
    SimpleGame = (function(_super) {

      __extends(SimpleGame, _super);

      function SimpleGame() {
        SimpleGame.__super__.constructor.apply(this, arguments);
      }

      SimpleGame.prototype._getInitialScreen = function() {
        return new SplashScreen(this);
      };

      return SimpleGame;

    })(Game);
    return SimpleGame;
  });

}).call(this);
