// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

pragma Singleton
import QtQuick 2.15

QtObject {
    /**
      *
      */
    function blend(color1, color2) {
        let color = color1;
        color.r = (color1.r + color2.r) / 2;
        color.g = (color1.g + color2.g) / 2;
        color.b = (color1.b + color2.b) / 2;
        color.b = (color1.a + color2.a) / 2;
        return color;
    }

    function setAlpha(color, alpha) {
        color.a = alpha;
        return color;
    }

    function clamp(x, a, b) {
        return Math.min(Math.max(x, a), b);
    }

    function remap(value, low1, high1, low2, high2) {
        return low2 + (high2 - low2) * (value - low1) / (high1 - low1);
    }

    function invertColor(color) {
        return Qt.rgba(1.0 - color.r, 1.0 - color.g, 1.0 - color.b, 1.0);
    }
}
