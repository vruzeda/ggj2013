(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var TubesStructure;
    TubesStructure = (function(_super) {

      __extends(TubesStructure, _super);

      function TubesStructure() {
        TubesStructure.__super__.constructor.call(this, 400, 360);
      }

      TubesStructure.prototype.getImageName = function() {
        return "tubesStructure";
      };

      return TubesStructure;

    })(Decoration);
    return TubesStructure;
  });

}).call(this);
