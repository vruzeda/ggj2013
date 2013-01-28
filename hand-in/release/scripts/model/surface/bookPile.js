(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var BookPile;
    BookPile = (function(_super) {

      __extends(BookPile, _super);

      function BookPile() {
        BookPile.__super__.constructor.call(this, 590, 360);
      }

      BookPile.prototype.getImageName = function() {
        return "bookPile";
      };

      return BookPile;

    })(Surface);
    return BookPile;
  });

}).call(this);
