(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/physics/physicalEntity"], function(PhysicalEntity) {
    var Surface;
    Surface = (function(_super) {

      __extends(Surface, _super);

      function Surface(width, height) {
        Surface.__super__.constructor.call(this, width, height);
      }

      return Surface;

    })(PhysicalEntity);
    return Surface;
  });

}).call(this);
