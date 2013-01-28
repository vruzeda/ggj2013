(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var WarmingLeftNerfedCharacterState;
    WarmingLeftNerfedCharacterState = (function(_super) {

      __extends(WarmingLeftNerfedCharacterState, _super);

      function WarmingLeftNerfedCharacterState() {
        WarmingLeftNerfedCharacterState.__super__.constructor.apply(this, arguments);
      }

      WarmingLeftNerfedCharacterState.prototype.getImageName = function() {
        return "warmingLeftNerfedCharacter";
      };

      WarmingLeftNerfedCharacterState.prototype.update = function(character, deltaTime) {};

      WarmingLeftNerfedCharacterState.prototype.move = function(character, direction) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftNerfedCharacterState.prototype.crouch = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftNerfedCharacterState.prototype.jump = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftNerfedCharacterState.prototype.warmLeft = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftNerfedCharacterState.prototype.warmRight = function(character) {
        var WarmingRightNerfedCharacterState;
        character.increaseHeartBeat();
        WarmingRightNerfedCharacterState = require("model/character/nerfed/warmingRightNerfedCharacterState");
        return character.setState(new WarmingRightNerfedCharacterState);
      };

      WarmingLeftNerfedCharacterState.prototype._goBackToStandingState = function(character) {
        var StandingNerfedCharacterState;
        StandingNerfedCharacterState = require("model/character/nerfed/standingNerfedCharacterState");
        return character.setState(new StandingNerfedCharacterState);
      };

      return WarmingLeftNerfedCharacterState;

    })(CharacterState);
    return WarmingLeftNerfedCharacterState;
  });

}).call(this);
