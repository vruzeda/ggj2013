(function() {

  define([], function() {
    var CharacterState;
    CharacterState = (function() {

      function CharacterState() {}

      CharacterState.prototype.getImageName = function() {
        throw new Error("Cannot invoke abstract method CharacterState.getImageName().");
      };

      CharacterState.prototype.update = function(character, deltaTime) {
        throw new Error("Cannot invoke abstract method CharacterState.update(character, deltaTime).");
      };

      CharacterState.prototype.move = function(character, direction) {
        throw new Error("Cannot invoke abstract method CharacterState.move(character, direction).");
      };

      CharacterState.prototype.stop = function() {};

      CharacterState.prototype.crouch = function(character) {
        throw new Error("Cannot invoke abstract method CharacterState.crouch(character).");
      };

      CharacterState.prototype.jump = function(character) {
        throw new Error("Cannot invoke abstract method CharacterState.jump(character).");
      };

      CharacterState.prototype.warmLeft = function(character) {
        throw new Error("Cannot invoke abstract method CharacterState.warmLeft(character).");
      };

      CharacterState.prototype.warmRight = function(character) {
        throw new Error("Cannot invoke abstract method CharacterState.warmRight(character).");
      };

      CharacterState.prototype.isCaptured = function() {
        return false;
      };

      return CharacterState;

    })();
    return CharacterState;
  });

}).call(this);
