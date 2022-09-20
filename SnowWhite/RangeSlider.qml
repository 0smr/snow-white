// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls  2.15 as QQC

T.RangeSlider {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            first.implicitHandleWidth + leftPadding + rightPadding,
                            second.implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             first.implicitHandleHeight + topPadding + bottomPadding,
                             second.implicitHandleHeight + topPadding + bottomPadding)
    padding: 6

    component Handler: Rectangle {
        property real vpos: 0
        x: control.leftPadding + (control.horizontal ? vpos * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (!control.horizontal ? vpos * (control.availableHeight - height) : (control.availableHeight - height) / 2)

        implicitWidth: 20
        implicitHeight: 20

        radius: width / 2
        border {
            color: control.palette.window
            width: 2
        }
    }

    first.handle: Handler {
        vpos: control.first.visualPosition
        color: control.first.pressed ? Qt.lighter(control.palette.button, 1.1) : control.palette.button
        border.color: activeFocus ? control.palette.highlight : control.palette.window
    }

    second.handle: Handler {
        vpos: control.second.visualPosition
        color: control.second.pressed ? Qt.lighter(control.palette.button, 1.1) : control.palette.button
        border.color: activeFocus ? control.palette.highlight : control.palette.window
    }

    background: Rectangle {
        x: (control.width - width) / 2
        y: (control.height - height) / 2

        implicitWidth: !control.vertical ? 200 : 2
        implicitHeight: control.vertical ? 200 : 2

        width: !control.vertical ? control.availableWidth : implicitWidth
        height: control.vertical ? control.availableHeight : implicitHeight

        radius: width
        color: control.palette.button
    }
}
