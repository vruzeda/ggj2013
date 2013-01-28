(function() {

  define(["jquery"], function($) {
    var InputController, InputControllerInstance, SPECIAL_BUTTONS;
    SPECIAL_BUTTONS = {
      13: "ENTER",
      37: "LEFT",
      38: "UP",
      39: "RIGHT",
      40: "DOWN"
    };
    InputControllerInstance = (function() {
      var CLICK_EVENTS;

      CLICK_EVENTS = ["click", "tap"];

      function InputControllerInstance(containerId) {
        var _this = this;
        this._listeners = {};
        $("#" + containerId).css("outline", "none");
        $("#" + containerId).keydown(function(event) {
          var char, listener, _i, _len, _ref;
          char = String.fromCharCode(event.keyCode);
          if (SPECIAL_BUTTONS[event.keyCode] != null) {
            char = SPECIAL_BUTTONS[event.keyCode];
          }
          if (_this._listeners[char] != null) {
            _ref = _this._listeners[char];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              listener = _ref[_i];
              listener(event);
            }
            return false;
          }
        });
        $("#" + containerId).keyup(function(event) {
          var char, listener, _i, _len, _ref;
          char = String.fromCharCode(event.keyCode);
          if (SPECIAL_BUTTONS[event.keyCode] != null) {
            char = SPECIAL_BUTTONS[event.keyCode];
          }
          if (_this._listeners[char] != null) {
            _ref = _this._listeners[char];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              listener = _ref[_i];
              listener(event);
            }
            return false;
          }
        });
      }

      InputControllerInstance.prototype.addClickListener = function(node, listener) {
        var clickEvent, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = CLICK_EVENTS.length; _i < _len; _i++) {
          clickEvent = CLICK_EVENTS[_i];
          _results.push(node.on(clickEvent, function() {
            return listener(node);
          }));
        }
        return _results;
      };

      InputControllerInstance.prototype.removeClickListener = function(node, listener) {
        var clickEvent, listenerIndex, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = CLICK_EVENTS.length; _i < _len; _i++) {
          clickEvent = CLICK_EVENTS[_i];
          if (node.eventListeners[clickEvent] != null) {
            listenerIndex = node.eventListeners[clickEvent].indexOf(listener);
            if (listenerIndex !== -1) {
              _results.push(node.eventListeners[clickEvent].splice(listenerIndex, 1));
            } else {
              _results.push(void 0);
            }
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      };

      InputControllerInstance.prototype.removeClickListeners = function(node) {
        var clickEvent, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = CLICK_EVENTS.length; _i < _len; _i++) {
          clickEvent = CLICK_EVENTS[_i];
          _results.push(node.off(clickEvent));
        }
        return _results;
      };

      InputControllerInstance.prototype.addCharListener = function(char, listener) {
        var _base;
        if ((_base = this._listeners)[char] == null) _base[char] = [];
        return this._listeners[char].push(listener);
      };

      InputControllerInstance.prototype.removeCharListener = function(char, listener) {
        var listenerIndex;
        if (this._listeners[char] != null) {
          listenerIndex = this._listeners[char].indexOf(listener);
          if (listenerIndex !== -1) {
            return this._listeners[char].splice(listenerIndex, 1);
          }
        }
      };

      InputControllerInstance.prototype.removeCharListeners = function(char) {
        if (this._listeners[char] != null) {
          while (this._listeners[char].length > 0) {
            this._listeners[char].pop();
          }
          return delete this._listeners[char];
        }
      };

      InputControllerInstance.prototype.removeAllCharListeners = function() {
        var key, _results;
        _results = [];
        for (key in this._listeners) {
          _results.push(this.removeListenersForChar(key));
        }
        return _results;
      };

      return InputControllerInstance;

    })();
    InputController = (function() {

      function InputController() {}

      InputController._instance = null;

      InputController.getInstance = function(containerId) {
        if (this._instance == null) {
          this._instance = new InputControllerInstance(containerId);
        }
        return this._instance;
      };

      return InputController;

    })();
    return InputController;
  });

}).call(this);
