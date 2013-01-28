(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState", "model/character/regular/movingJumpingPumpedCharacterState"], function(CharacterState) {
    var JumpingPumpedCharacterState;
    JumpingPumpedCharacterState = (function(_super) {

      __extends(JumpingPumpedCharacterState, _super);

      function JumpingPumpedCharacterState() {
        JumpingPumpedCharacterState.__super__.constructor.apply(this, arguments);
      }

      JumpingPumpedCharacterState.prototype.getImageName = function() {
        return "jumpingPumpedCharacter";
      };

      JumpingPumpedCharacterState.prototype.update = function(character, deltaTime) {};

      JumpingPumpedCharacterState.prototype.move = function(character, direction) {
        return character.setState(new MovingJumpingPumpedCharacterState(this._direction));
      };

      JumpingPumpedCharacterState.prototype.crouch = function(character) {};

      JumpingPumpedCharacterState.prototype.jump = function(character) {};

      JumpingPumpedCharacterState.prototype.warmLeft = function(character) {};

      JumpingPumpedCharacterState.prototype.warmRight = function(character) {};

      return JumpingPumpedCharacterState;

    })(CharacterState);
    return JumpingPumpedCharacterState;
  });

}).call(this);
