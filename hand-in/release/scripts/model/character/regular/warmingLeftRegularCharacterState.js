(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  define(["model/character/characterState"], function(CharacterState) {
    var WarmingLeftRegularCharacterState;
    WarmingLeftRegularCharacterState = (function(_super) {

      __extends(WarmingLeftRegularCharacterState, _super);

      function WarmingLeftRegularCharacterState() {
        WarmingLeftRegularCharacterState.__super__.constructor.apply(this, arguments);
      }

      WarmingLeftRegularCharacterState.prototype.getImageName = function() {
        return "warmingLeftRegularCharacter";
      };

      WarmingLeftRegularCharacterState.prototype.update = function(character, deltaTime) {};

      WarmingLeftRegularCharacterState.prototype.move = function(character, direction) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftRegularCharacterState.prototype.crouch = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftRegularCharacterState.prototype.jump = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftRegularCharacterState.prototype.warmLeft = function(character) {
        return this._goBackToStandingState(character);
      };

      WarmingLeftRegularCharacterState.prototype.warmRight = function(character) {
        var WarmingRightRegularCharacterState;
        character.increaseHeartBeat();
        WarmingRightRegularCharacterState = require("model/character/regular/warmingRightRegularCharacterState");
        return character.setState(new WarmingRightRegularCharacterState);
      };

      WarmingLeftRegularCharacterState.prototype._goBackToStandingState = function(character) {
        var StandingRegularCharacterState;
        StandingRegularCharacterState = require("model/character/regular/standingRegularCharacterState");
        return character.setState(new StandingRegularCharacterState);
      };

      return WarmingLeftRegularCharacterState;

    })(CharacterState);
    return WarmingLeftRegularCharacterState;
  });

}).call(this);
