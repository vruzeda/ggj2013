(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["kinetic", "framework/screen", "framework/imageLoader", "screen/gameScreen", "screen/optionsScreen"], function(Kinetic, Screen, ImageLoader, GameScreen, OptionsScreen) {
    var MainScreen;
    MainScreen = (function(_super) {

      __extends(MainScreen, _super);

      function MainScreen() {
        this.onStartGame = __bind(this.onStartGame, this);
        MainScreen.__super__.constructor.apply(this, arguments);
      }

      MainScreen.prototype._constructLayout = function() {
        this._layer.add(new Kinetic.Image({
          image: ImageLoader.getImage("mainBackground")
        }));
        return this._layer.add(new Kinetic.Image({
          image: ImageLoader.getImage("startGameButton"),
          x: 240,
          y: 430
        }));
      };

      MainScreen.prototype._constructInputEvents = function(inputController) {
        inputController.addCharListener("ENTER", this.onStartGame);
        return inputController.addCharListener("H", this.onStartGame);
      };

      MainScreen.prototype._destroyInputEvents = function(inputController) {
        inputController.removeCharListener("ENTER", this.onStartGame);
        return inputController.removeCharListener("H", this.onStartGame);
      };

      MainScreen.prototype.onStartGame = function() {
        return this._game.switchScreen(this, new GameScreen(this._game));
      };

      return MainScreen;

    })(Screen);
    return MainScreen;
  });

}).call(this);
