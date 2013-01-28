(function() {

  define([], function() {
    var PhysicalEntity;
    PhysicalEntity = (function() {

      function PhysicalEntity(_width, _height) {
        this._width = _width;
        this._height = _height;
        this._position = {
          x: 0,
          y: 0
        };
        this._speed = {
          x: 0,
          y: 0
        };
      }

      PhysicalEntity.prototype.getWidth = function() {
        return this._width;
      };

      PhysicalEntity.prototype.setWidth = function(width) {
        this._position.x += (this._width - width) / 2;
        return this._width = width;
      };

      PhysicalEntity.prototype.getHeight = function() {
        return this._height;
      };

      PhysicalEntity.prototype.setHeight = function(height) {
        this._position.y += this._height - height;
        return this._height = height;
      };

      PhysicalEntity.prototype.getPosition = function() {
        return {
          x: this._position.x,
          y: this._position.y
        };
      };

      PhysicalEntity.prototype.setPosition = function(position) {
        return this._position = {
          x: position.x,
          y: position.y
        };
      };

      PhysicalEntity.prototype.moveBy = function(delta) {
        return this.setPosition({
          x: this._position.x + delta.x,
          y: this._position.y + delta.y
        });
      };

      PhysicalEntity.prototype.getSpeed = function() {
        return {
          x: this._speed.x,
          y: this._speed.y
        };
      };

      PhysicalEntity.prototype.setSpeed = function(speed) {
        return this._speed = {
          x: speed.x,
          y: speed.y
        };
      };

      PhysicalEntity.prototype.getImageName = function() {
        throw new Error("Cannot invoke abstract method PhysicalEntity.getImageName().");
      };

      PhysicalEntity.prototype.collidesRightWith = function(that, deltaX) {
        var thatBL, thatTL, thatTR, thisBR, thisTR, _ref, _ref2, _ref3;
        thisTR = this._topRight();
        thisBR = this._bottomRight();
        thatTL = that._topLeft();
        thatTR = that._topRight();
        thatBL = that._bottomLeft();
        thisTR.x += deltaX;
        thisBR.x += deltaX;
        if ((thatTL.x <= (_ref = thisTR.x) && _ref <= thatTR.x)) {
          if ((thatTL.y <= (_ref2 = thisTR.y) && _ref2 <= thatBL.y) || (thatTL.y <= (_ref3 = thisBR.y) && _ref3 <= thatBL.y)) {
            deltaX = thatTL.x - thisTR.x;
          }
        }
        return deltaX;
      };

      PhysicalEntity.prototype.collidesLeftWith = function(that, deltaX) {
        var thatBR, thatTL, thatTR, thisBL, thisTL, _ref, _ref2, _ref3;
        thisTL = this._topLeft();
        thisBL = this._bottomLeft();
        thatTR = that._topRight();
        thatTL = that._topLeft();
        thatBR = that._bottomRight();
        thisTL.x += deltaX;
        thisBL.x += deltaX;
        if ((thatTL.x <= (_ref = thisTL.x) && _ref <= thatTR.x)) {
          if ((thatTR.y <= (_ref2 = thisTL.y) && _ref2 <= thatBR.y) || (thatTR.y <= (_ref3 = thisBL.y) && _ref3 <= thatBR.y)) {
            deltaX = thatTR.x - thisTL.x;
          }
        }
        return deltaX;
      };

      PhysicalEntity.prototype.collidesTopWith = function(that, deltaY) {
        var thatBR, thatTL, thatTR, thisTL, thisTR, _ref, _ref2, _ref3;
        thisTL = this._topLeft();
        thisTR = this._topRight();
        thatTR = that._topRight();
        thatTL = that._topLeft();
        thatBR = that._bottomRight();
        thisTL.y += deltaY;
        if ((thatTR.y <= (_ref = thisTL.y) && _ref <= thatBR.y)) {
          if ((thatTL.x <= (_ref2 = thisTL.x) && _ref2 <= thatBR.x) || (thatTL.x <= (_ref3 = thisTR.x) && _ref3 <= thatBR.x)) {
            deltaY = (thatBR.y + 0.1) - thisTR.y;
          }
        }
        return deltaY;
      };

      PhysicalEntity.prototype.collidesBottomWith = function(that, deltaY) {
        var thatBR, thatTL, thatTR, thisBL, thisBR, _ref, _ref2, _ref3;
        thisBL = this._bottomLeft();
        thisBR = this._bottomRight();
        thatTR = that._topRight();
        thatTL = that._topLeft();
        thatBR = that._bottomRight();
        thisBL.y += deltaY;
        if ((thatTR.y <= (_ref = thisBL.y) && _ref <= thatBR.y)) {
          if ((thatTL.x <= (_ref2 = thisBL.x) && _ref2 <= thatBR.x) || (thatTL.x <= (_ref3 = thisBR.x) && _ref3 <= thatBR.x)) {
            deltaY = (thatTR.y - 0.1) - thisBR.y;
          }
        }
        return deltaY;
      };

      PhysicalEntity.prototype._topLeft = function() {
        return {
          x: this._position.x,
          y: this._position.y
        };
      };

      PhysicalEntity.prototype._topRight = function() {
        return {
          x: this._position.x + this._width,
          y: this._position.y
        };
      };

      PhysicalEntity.prototype._bottomLeft = function() {
        return {
          x: this._position.x,
          y: this._position.y + this._height
        };
      };

      PhysicalEntity.prototype._bottomRight = function() {
        return {
          x: this._position.x + this._width,
          y: this._position.y + this._height
        };
      };

      return PhysicalEntity;

    })();
    return PhysicalEntity;
  });

}).call(this);
