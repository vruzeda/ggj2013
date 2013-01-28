(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/decoration/decoration"], function(Constants, Decoration) {
    var EndingWindow;
    EndingWindow = (function(_super) {

      __extends(EndingWindow, _super);

      function EndingWindow() {
        EndingWindow.__super__.constructor.call(this, 400, 580);
      }

      EndingWindow.prototype.getImageName = function() {
        return "endingWindow";
      };

      return EndingWindow;

    })(Decoration);
    return EndingWindow;
  });

}).call(this);
