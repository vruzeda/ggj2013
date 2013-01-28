(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var supportConico;
    supportConico = (function(_super) {

      __extends(supportConico, _super);

      function supportConico() {
        supportConico.__super__.constructor.call(this, 200, 360);
      }

      supportConico.prototype.getImageName = function() {
        return "bureta";
      };

      return supportConico;

    })(Surface);
    return supportConico;
  });

}).call(this);
