(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var WindowBase;
    WindowBase = (function(_super) {

      __extends(WindowBase, _super);

      function WindowBase() {
        WindowBase.__super__.constructor.call(this, 210, 454);
      }

      WindowBase.prototype.getImageName = function() {
        return "windowBase";
      };

      return WindowBase;

    })(Surface);
    return WindowBase;
  });

}).call(this);
