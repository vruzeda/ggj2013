(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var CEIL, Ceil;
    CEIL = Constants.CEIL;
    Ceil = (function(_super) {

      __extends(Ceil, _super);

      function Ceil() {
        Ceil.__super__.constructor.call(this, CEIL.width, CEIL.height);
      }

      Ceil.prototype.getImageName = function() {
        return "table";
      };

      return Ceil;

    })(Surface);
    return Ceil;
  });

}).call(this);
