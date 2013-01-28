(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/surface/surface"], function(Constants, Surface) {
    var TABLE, Table;
    TABLE = Constants.TABLE;
    Table = (function(_super) {

      __extends(Table, _super);

      function Table() {
        Table.__super__.constructor.call(this, TABLE.width, TABLE.height);
      }

      Table.prototype.getImageName = function() {
        return "table";
      };

      return Table;

    })(Surface);
    return Table;
  });

}).call(this);