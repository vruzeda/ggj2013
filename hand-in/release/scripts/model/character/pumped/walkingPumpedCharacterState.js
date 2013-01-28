(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState", "model/character/pumped/jumpingPumpedCharacterState"], function(CharacterState, JumpingPumpedCharacterState) {
    var WalkingPumpedCharacterState;
    WalkingPumpedCharacterState = (function(_super) {

      __extends(WalkingPumpedCharacterState, _super);

      function WalkingPumpedCharacterState(_direction) {
        this._direction = _direction;
        WalkingPumpedCharacterState.__super__.constructor.call(this);
      }

      WalkingPumpedCharacterState.prototype.update = function(character, deltaTime) {};

      WalkingPumpedCharacterState.prototype.getImageName = function() {
        return "walkingPumpedCharacterState";
      };

      WalkingPumpedCharacterState.prototype.move = function(character, direction) {
        if (this._direction !== direction) return this._direction = direction;
      };

      WalkingPumpedCharacterState.prototype.crouch = function(character) {};

      WalkingPumpedCharacterState.prototype.jump = function(character) {
        return character.setState(new JumpingPumpedCharacterState);
      };

      WalkingPumpedCharacterState.prototype.warmLeft = function(character) {};

      WalkingPumpedCharacterState.prototype.warmRight = function(character) {};

      return WalkingPumpedCharacterState;

    })(CharacterState);
    return WalkingPumpedCharacterState;
  });

}).call(this);
