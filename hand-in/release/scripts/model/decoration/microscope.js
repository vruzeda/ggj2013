(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var Microscope;
    Microscope = (function(_super) {

      __extends(Microscope, _super);

      function Microscope() {
        Microscope.__super__.constructor.call(this, 400, 540);
      }

      Microscope.prototype.getImageName = function() {
        return "microscope";
      };

      return Microscope;

    })(Decoration);
    return Microscope;
  });

}).call(this);
