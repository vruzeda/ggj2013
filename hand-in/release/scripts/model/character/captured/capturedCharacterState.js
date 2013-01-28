(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var CapturedCharacterState;
    CapturedCharacterState = (function(_super) {

      __extends(CapturedCharacterState, _super);

      function CapturedCharacterState(_reason) {
        this._reason = _reason;
      }

      CapturedCharacterState.prototype.getImageName = function() {
        return this._reason;
      };

      CapturedCharacterState.prototype.update = function(character, deltaTime) {};

      CapturedCharacterState.prototype.move = function(character, direction) {};

      CapturedCharacterState.prototype.crouch = function(character) {};

      CapturedCharacterState.prototype.jump = function(character) {};

      CapturedCharacterState.prototype.warmLeft = function(character) {};

      CapturedCharacterState.prototype.warmRight = function(character) {};

      CapturedCharacterState.prototype.isCaptured = function() {
        return true;
      };

      return CapturedCharacterState;

    })(CharacterState);
    return CapturedCharacterState;
  });

}).call(this);
