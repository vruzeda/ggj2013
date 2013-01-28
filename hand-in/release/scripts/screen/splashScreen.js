(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["kinetic", "framework/screen", "framework/imageLoader", "screen/loadingScreen"], function(Kinetic, Screen, ImageLoader, LoadingScreen) {
    var SplashScreen;
    SplashScreen = (function(_super) {

      __extends(SplashScreen, _super);

      function SplashScreen() {
        SplashScreen.__super__.constructor.apply(this, arguments);
      }

      SplashScreen.prototype._constructLayout = function() {
        var _this = this;
        this._layer.add(new Kinetic.Rect({
          width: this.getWidth(),
          height: this.getHeight(),
          fill: "black"
        }));
        ImageLoader.addToList({
          LOADING_SCREEN: {
            flubber: "images/flubber.png"
          }
        });
        return ImageLoader.loadImages({
          list: ["LOADING_SCREEN"],
          progressCallback: function(total, complete, success) {},
          completeCallback: function() {
            _this._game.showScreen(new LoadingScreen(_this._game));
            return _this._game.hideScreen(_this);
          }
        });
      };

      SplashScreen.prototype._constructInputEvents = function(inputController) {};

      SplashScreen.prototype._destroyInputEvents = function(inputController) {};

      return SplashScreen;

    })(Screen);
    return SplashScreen;
  });

}).call(this);
