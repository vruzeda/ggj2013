(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var WarmingRightPumpedCharacterState;
    WarmingRightPumpedCharacterState = (function(_super) {

      __extends(WarmingRightPumpedCharacterState, _super);

      function WarmingRightPumpedCharacterState() {
        WarmingRightPumpedCharacterState.__super__.constructor.apply(this, arguments);
      }

      WarmingRightPumpedCharacterState.prototype.getImageName = function() {
        return "warmingRightPumpedCharacter";
      };

      WarmingRightPumpedCharacterState.prototype.update = function(character, deltaTime) {};

      WarmingRightPumpedCharacterState.prototype.move = function(character, direction) {
        return this._goBackToStandingState(character);
      };

      WarmingRightPumpedCharacterState.prototype.crouch = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightPumpedCharacterState.prototype.jump = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightPumpedCharacterState.prototype.warmLeft = function(character) {
        var WarmingLeftPumpedCharacterState;
        character.increaseHeartBeat();
        WarmingLeftPumpedCharacterState = require("model/character/pumped/warmingLeftPumpedCharacterState");
        return character.setState(new WarmingLeftPumpedCharacterState);
      };

      WarmingRightPumpedCharacterState.prototype.warmRight = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingRightPumpedCharacterState.prototype._goBackToStandingState = function(character) {
        var StandingPumpedCharacterState;
        StandingPumpedCharacterState = require("model/character/pumped/standingPumpedCharacterState");
        return character.setState(new StandingPumpedCharacterState);
      };

      return WarmingRightPumpedCharacterState;

    })(CharacterState);
    return WarmingRightPumpedCharacterState;
  });

}).call(this);
