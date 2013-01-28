(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var Books;
    Books = (function(_super) {

      __extends(Books, _super);

      function Books() {
        Books.__super__.constructor.call(this, 590, 180);
      }

      Books.prototype.getImageName = function() {
        return "books";
      };

      return Books;

    })(Surface);
    return Books;
  });

}).call(this);
