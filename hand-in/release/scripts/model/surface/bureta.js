(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var Bureta;
    Bureta = (function(_super) {

      __extends(Bureta, _super);

      function Bureta() {
        Bureta.__super__.constructor.call(this, 200, 360);
      }

      Bureta.prototype.getImageName = function() {
        return "bureta";
      };

      return Bureta;

    })(Surface);
    return Bureta;
  });

}).call(this);
