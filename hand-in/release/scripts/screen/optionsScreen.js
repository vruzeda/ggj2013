(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["kinetic", "framework/screen"], function(Kinetic, Screen) {
    var OptionsScreen;
    OptionsScreen = (function(_super) {

      __extends(OptionsScreen, _super);

      function OptionsScreen() {
        OptionsScreen.__super__.constructor.apply(this, arguments);
      }

      OptionsScreen.prototype._constructLayout = function() {
        var alpha, height, width, _results;
        width = this.getWidth();
        height = this.getHeight();
        _results = [];
        for (alpha = 0; alpha <= 100; alpha++) {
          _results.push(this._layer.add(new Kinetic.Rect({
            x: alpha * width / 100 + 1,
            y: 0,
            width: width / 100 + 2,
            height: height,
            fill: "black",
            opacity: alpha / 100
          })));
        }
        return _results;
      };

      OptionsScreen.prototype._constructInputEvents = function(inputController) {};

      OptionsScreen.prototype._destroyInputEvents = function(inputController) {};

      return OptionsScreen;

    })(Screen);
    return OptionsScreen;
  });

}).call(this);
