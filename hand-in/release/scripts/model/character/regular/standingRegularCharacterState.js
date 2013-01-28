(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/constants", "model/character/characterState", "model/character/regular/jumpingRegularCharacterState", "model/character/regular/walkingRegularCharacterState", "model/character/regular/warmingLeftRegularCharacterState", "model/character/regular/warmingRightRegularCharacterState"], function(Constants, CharacterState, JumpingRegularCharacterState, WalkingRegularCharacterState, WarmingLeftRegularCharacterState, WarmingRightRegularCharacterState) {
    var JUMP_SPEEDS, SPEEDS, StandingRegularCharacterState;
    SPEEDS = Constants.SPEEDS, JUMP_SPEEDS = Constants.JUMP_SPEEDS;
    StandingRegularCharacterState = (function(_super) {

      __extends(StandingRegularCharacterState, _super);

      function StandingRegularCharacterState() {
        StandingRegularCharacterState.__super__.constructor.apply(this, arguments);
      }

      StandingRegularCharacterState.prototype.getImageName = function() {
        return "standingRegularCharacter";
      };

      StandingRegularCharacterState.prototype.update = function(character, deltaTime) {
        return character.decreaseHeartBeat(character, deltaTime);
      };

      StandingRegularCharacterState.prototype.move = function(character, direction) {
        var deltaSpeedX, speed;
        deltaSpeedX = direction === "left" ? -SPEEDS.regular : SPEEDS.regular;
        speed = character.getSpeed();
        character.setSpeed({
          x: speed.x + deltaSpeedX,
          y: speed.y
        });
        return character.setState(new WalkingRegularCharacterState(direction));
      };

      StandingRegularCharacterState.prototype.crouch = function(character) {};

      StandingRegularCharacterState.prototype.jump = function(character) {
        var speed;
        speed = character.getSpeed();
        character.setSpeed({
          x: speed.x,
          y: speed.y - JUMP_SPEEDS.regular
        });
        return character.setState(new JumpingRegularCharacterState);
      };

      StandingRegularCharacterState.prototype.warmLeft = function(character) {
        return character.setState(new WarmingLeftRegularCharacterState);
      };

      StandingRegularCharacterState.prototype.warmRight = function(character) {
        return character.setState(new WarmingRightRegularCharacterState);
      };

      return StandingRegularCharacterState;

    })(CharacterState);
    return StandingRegularCharacterState;
  });

}).call(this);
