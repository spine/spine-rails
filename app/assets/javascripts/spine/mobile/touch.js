(function() {
  var $, m, parentIfText, swipeDirection, touch, types, _fn, _i, _len;
  $ = require('spine').$;
  $.support.touch = 'ontouchstart' in window;
  touch = {};
  parentIfText = function(node) {
    if ('tagName' in node) {
      return node;
    } else {
      return node.parentNode;
    }
  };
  swipeDirection = function(x1, x2, y1, y2) {
    var xDelta, yDelta;
    xDelta = Math.abs(x1 - x2);
    yDelta = Math.abs(y1 - y2);
    if (xDelta >= yDelta) {
      if (x1 - x2 > 0) {
        return 'Left';
      } else {
        return 'Right';
      }
    } else {
      if (y1 - y2 > 0) {
        return 'Up';
      } else {
        return 'Down';
      }
    }
  };
  $(function() {
    return $('body').bind('touchstart', function(e) {
      var delta, now;
      e = e.originalEvent;
      now = Date.now();
      delta = now - (touch.last || now);
      touch.target = parentIfText(e.touches[0].target);
      touch.x1 = e.touches[0].pageX;
      touch.y1 = e.touches[0].pageY;
      return touch.last = now;
    }).bind('touchmove', function(e) {
      e = e.originalEvent;
      touch.x2 = e.touches[0].pageX;
      return touch.y2 = e.touches[0].pageY;
    }).bind('touchend', function(e) {
      e = e.originalEvent;
      if (touch.x2 > 0 || touch.y2 > 0) {
        (Math.abs(touch.x1 - touch.x2) > 30 || Math.abs(touch.y1 - touch.y2) > 30) && $(touch.target).trigger('swipe') && $(touch.target).trigger('swipe' + (swipeDirection(touch.x1, touch.x2, touch.y1, touch.y2)));
        return touch.x1 = touch.x2 = touch.y1 = touch.y2 = touch.last = 0;
      } else if ('last' in touch) {
        $(touch.target).trigger('tap');
        return touch = {};
      }
    }).bind('touchcancel', function(e) {
      return touch = {};
    });
  });
  if ($.support.touch) {
    $('body').bind('click', function(e) {
      return e.preventDefault();
    });
  } else {
    $(function() {
      return $('body').bind('click', function(e) {
        return $(e.target).trigger('tap');
      });
    });
  }
  types = ['swipe', 'swipeLeft', 'swipeRight', 'swipeUp', 'swipeDown', 'tap'];
  _fn = function(m) {
    return $.fn[m] = function(callback) {
      return this.bind(m, callback);
    };
  };
  for (_i = 0, _len = types.length; _i < _len; _i++) {
    m = types[_i];
    _fn(m);
  }
}).call(this);
