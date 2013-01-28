(function() {

  define([], function() {
    var ImageLoader, ImageLoaderConstants, ImageLoaderInstance, ImageLoaderStatus;
    ImageLoaderStatus = (function() {

      function ImageLoaderStatus() {}

      ImageLoaderStatus.PENDING = 1;

      ImageLoaderStatus.LOADING = 2;

      ImageLoaderStatus.COMPLETE = 3;

      ImageLoaderStatus.ERROR = -1;

      ImageLoaderStatus.ABORTED = -2;

      return ImageLoaderStatus;

    })();
    ImageLoaderConstants = (function() {

      function ImageLoaderConstants() {}

      ImageLoaderConstants.BACKGROUND_DOWNLOADS = 2;

      ImageLoaderConstants.DELAY = 100;

      return ImageLoaderConstants;

    })();
    ImageLoaderInstance = (function() {

      function ImageLoaderInstance() {
        this._images = {};
        this._lists = {};
        this._optionalLoadList = [];
      }

      ImageLoaderInstance.prototype.setList = function(list) {
        return this._processList(list);
      };

      ImageLoaderInstance.prototype._processList = function(list) {
        var imageInfo, imageList, imageListName, imageName, imageURL, listImages, _results;
        _results = [];
        for (imageListName in list) {
          imageList = list[imageListName];
          listImages = {};
          for (imageName in imageList) {
            imageURL = imageList[imageName];
            imageInfo = {
              url: imageURL,
              status: ImageLoaderStatus.PENDING,
              callbackList: [],
              name: imageName
            };
            this._images[imageName] = listImages[imageName] = imageInfo;
          }
          _results.push(this._lists[imageListName] = listImages);
        }
        return _results;
      };

      ImageLoaderInstance.prototype.startLoading = function(required, background) {
        var internalCompleteCallback, optionalImages, requiredImages,
          _this = this;
        requiredImages = this._getLists(required.list);
        optionalImages = this._getLists(background.list);
        internalCompleteCallback = function() {
          var _ref;
          _this._loadOptionalList(optionalImages, background.progressCallback, background.completeCallback);
          return (_ref = required.completeCallback) != null ? _ref.apply(_this, arguments) : void 0;
        };
        return this._loadList(requiredImages, required.progressCallback, internalCompleteCallback);
      };

      ImageLoaderInstance.prototype._getLists = function(listNames) {
        var key, list, listName, value, _i, _len, _ref;
        list = {};
        for (_i = 0, _len = listNames.length; _i < _len; _i++) {
          listName = listNames[_i];
          _ref = this._lists[listName];
          for (key in _ref) {
            value = _ref[key];
            list[key] = value;
          }
        }
        return list;
      };

      ImageLoaderInstance.prototype._attachCallback = function(imageInfo, callback) {
        var _this = this;
        if (callback != null) {
          return imageInfo.callbackList.push(function() {
            return callback.apply(_this, arguments);
          });
        }
      };

      ImageLoaderInstance.prototype._callCallbacks = function(imageInfo) {
        var callback, _fn, _i, _len, _ref,
          _this = this;
        if ((imageInfo != null) && imageInfo.callbackList.length > 0) {
          _ref = imageInfo.callbackList;
          _fn = function(callback) {
            return _this._defer(function() {
              return callback(imageInfo.image, imageInfo);
            });
          };
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            callback = _ref[_i];
            _fn(callback);
          }
          return imageInfo.callbackList = [];
        }
      };

      ImageLoaderInstance.prototype._loadList = function(list, progressCallback, completeCallback) {
        var callComplete, callProgress, complete, imageInfo, imageName, numComplete, numImages, numSuccesses, _fn,
          _this = this;
        numComplete = numSuccesses = numImages = 0;
        callProgress = function(total, complete, success) {
          return _this._defer(progressCallback, total, complete, success);
        };
        callComplete = function() {
          return _this._defer(completeCallback);
        };
        complete = function(imageInfo, status) {
          if (imageInfo != null) {
            imageInfo.status = status;
            numComplete++;
          }
          if (status > 0) numSuccesses++;
          if (progressCallback != null) {
            callProgress(numImages, numComplete, numSuccesses);
          }
          if (numComplete === numImages && (completeCallback != null)) {
            callComplete();
          }
          return _this._callCallbacks(imageInfo);
        };
        _fn = function(imageName, imageInfo) {
          var image;
          numImages++;
          if (imageInfo.status !== ImageLoaderStatus.COMPLETE && imageInfo.status !== ImageLoaderStatus.LOADING) {
            image = new Image();
            image.onload = function() {
              return complete(imageInfo, ImageLoaderStatus.COMPLETE);
            };
            image.onabort = function() {
              return complete(imageInfo, ImageLoaderStatus.ABORTED);
            };
            image.onerror = function() {
              return complete(imageInfo, ImageLoaderStatus.ERROR);
            };
            imageInfo.image = image;
            imageInfo.status = ImageLoaderStatus.LOADING;
            return image.src = imageInfo.url;
          } else if (imageInfo.status === ImageLoaderStatus.COMPLETE) {
            return _this._defer(function() {
              return complete(imageInfo, ImageLoaderStatus.COMPLETE);
            });
          } else if (imageInfo.status === ImageLoaderStatus.LOADING) {
            return _this._attachCallback(imageInfo, function(image, imageInfo) {
              return complete(imageInfo, imageInfo.status);
            });
          }
        };
        for (imageName in list) {
          imageInfo = list[imageName];
          _fn(imageName, imageInfo);
        }
        if (list.length === 0) {
          if (progressCallback != null) {
            callProgress(numImages, numComplete, numSuccesses);
          }
          if (completeCallback != null) return callComplete();
        }
      };

      ImageLoaderInstance.prototype._loadOptionalList = function(optionalLists, progressCallback, completeCallback) {
        this._stopBackgroundLoad();
        this._addImagesToBackgroundLoadList(optionalLists);
        return this._startBackgroundLoad(progressCallback, completeCallback);
      };

      ImageLoaderInstance.prototype._addImagesToBackgroundLoadList = function(list) {
        var imageInfo, imageName, internalList;
        internalList = [];
        for (imageName in list) {
          imageInfo = list[imageName];
          if (imageInfo.status !== ImageLoaderStatus.COMPLETE && imageInfo.status !== ImageLoaderStatus.LOADING) {
            internalList.push(imageInfo);
          }
        }
        internalList.reverse();
        this._optionalLoadList = internalList.concat(this._optionalLoadList);
        this._optionalLoadList = this._filterCompleteOrInProgress(this._optionalLoadList);
        this._initialOptionalLoadListLength = this._optionalLoadList.length;
        this._optionalLoadCompleteNumber = 0;
        return this._optionalLoadSuccessNumber = 0;
      };

      ImageLoaderInstance.prototype._filterCompleteOrInProgress = function(list) {
        var imageInfo, _i, _len, _results;
        _results = [];
        for (_i = 0, _len = list.length; _i < _len; _i++) {
          imageInfo = list[_i];
          if (imageInfo.status !== ImageLoaderStatus.COMPLETE && imageInfo.status !== ImageLoaderStatus.LOADING) {
            _results.push(imageInfo);
          }
        }
        return _results;
      };

      ImageLoaderInstance.prototype._startBackgroundLoad = function(progressCallback, completeCallback) {
        var _this = this;
        this._backgroundLoadingStarted = true;
        return this._delay(function() {
          return _this._processBackgroundLoad(progressCallback, completeCallback);
        }, ImageLoaderConstants.DELAY);
      };

      ImageLoaderInstance.prototype._processBackgroundLoad = function(progressCallback, completeCallback) {
        var partialCompleteCallback, partialProgressCallback, partialrequiredList, previousSuccess, _i, _ref,
          _this = this;
        if (this._backgroundLoadingStarted) {
          partialrequiredList = [];
          for (_i = 1, _ref = ImageLoaderConstants.BACKGROUND_DOWNLOADS; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
            if (this._optionalLoadList.length > 0) {
              partialrequiredList.push(this._optionalLoadList.pop());
            }
          }
          if (partialrequiredList.length > 0) {
            previousSuccess = 0;
            partialProgressCallback = function(total, complete, success) {
              _this._optionalLoadCompleteNumber++;
              if (previousSuccess < success) _this._optionalLoadSuccessNumber++;
              previousSuccess = success;
              return typeof progressCallback === "function" ? progressCallback(_this._initialOptionalLoadListLength, _this._optionalLoadCompleteNumber, _this._optionalLoadSuccessNumber) : void 0;
            };
            partialCompleteCallback = function() {
              if (_this._optionalLoadList.length === 0) {
                return typeof completeCallback === "function" ? completeCallback() : void 0;
              } else {
                return _this._delay(function() {
                  return _this._processBackgroundLoad(progressCallback, completeCallback);
                }, ImageLoaderConstants.DELAY);
              }
            };
            return this._loadList(partialrequiredList, partialProgressCallback, partialCompleteCallback);
          } else {
            return this._stopBackgroundLoad();
          }
        }
      };

      ImageLoaderInstance.prototype._stopBackgroundLoad = function() {
        return this._backgroundLoadingStarted = false;
      };

      ImageLoaderInstance.prototype.getImage = function(imageName, callback) {
        var image, imageInfo;
        imageInfo = this._getImageInfo(imageName);
        image = null;
        if (imageInfo.status === ImageLoaderStatus.COMPLETE) {
          image = imageInfo.image;
          if (callback != null) {
            this._defer(function() {
              return callback(imageInfo.image);
            });
          }
        } else if (imageInfo.status === ImageLoaderStatus.LOADING) {
          this._attachCallback(imageInfo, callback);
        } else {
          this._attachCallback(imageInfo, callback);
          this._loadList([imageInfo]);
        }
        return image;
      };

      ImageLoaderInstance.prototype._getImageInfo = function(imageName) {
        return this._images[imageName];
      };

      ImageLoaderInstance.prototype._defer = function(deferredFunction) {
        var args, func;
        args = [].slice.call(arguments, 1);
        func = function() {
          return deferredFunction.apply(null, args);
        };
        return this._delay(func, 1);
      };

      ImageLoaderInstance.prototype._delay = function(delayedFunction, delay) {
        var args, func;
        args = [].slice.call(arguments, 2);
        func = function() {
          return delayedFunction.apply(null, args);
        };
        return setTimeout(func, delay);
      };

      return ImageLoaderInstance;

    })();
    ImageLoader = (function() {

      function ImageLoader() {}

      if (ImageLoader._instance == null) {
        ImageLoader._instance = new ImageLoaderInstance;
      }

      ImageLoader.getImage = function(imageName, callback) {
        return this._instance.getImage(imageName, callback);
      };

      ImageLoader.addToList = function(list) {
        return this._instance.setList(list);
      };

      ImageLoader.loadImages = function(required, background) {
        if (!(required != null)) {
          required = {
            list: [],
            progressCallback: null,
            completeCallback: null
          };
        }
        if (!(background != null)) {
          background = {
            list: [],
            progressCallback: null,
            completeCallback: null
          };
        }
        return this._instance.startLoading(required, background);
      };

      ImageLoader.loadLists = function(lists, onStart, onProgress, onFinish) {
        var background, completeCallback, progressCallback, required, startCallback;
        startCallback = function() {
          return typeof onStart === "function" ? onStart() : void 0;
        };
        progressCallback = function(total, complete, success) {
          var percentage;
          percentage = parseInt((complete / total) * 100, 10);
          return typeof onProgress === "function" ? onProgress(percentage) : void 0;
        };
        completeCallback = function() {
          return typeof onFinish === "function" ? onFinish() : void 0;
        };
        required = {
          list: lists.required || [],
          progressCallback: progressCallback,
          completeCallback: completeCallback
        };
        background = {
          list: lists.background || [],
          progressCallback: null,
          completeCallback: null
        };
        startCallback();
        return this.loadImages(required, background);
      };

      return ImageLoader;

    })();
    return ImageLoader;
  });

}).call(this);
