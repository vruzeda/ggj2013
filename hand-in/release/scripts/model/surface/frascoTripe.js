(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var FrascoTripe;
    FrascoTripe = (function(_super) {

      __extends(FrascoTripe, _super);

      function FrascoTripe() {
        FrascoTripe.__super__.constructor.call(this, 400, 520);
      }

      FrascoTripe.prototype.getImageName = function() {
        return "frascoTripe";
      };

      return FrascoTripe;

    })(Surface);
    return FrascoTripe;
  });

}).call(this);
