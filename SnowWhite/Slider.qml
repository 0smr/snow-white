// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir


import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.Slider {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitHandleHeight + topPadding + bottomPadding)
    padding: 6

    handle: Rectangle {
        x: control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2)
        y: control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height))

        implicitWidth: 20
        implicitHeight: 20

        color: control.palette.button
        radius: width

        border {
            color: visualFocus ? control.palette.highlight : control.palette.window
            width: 2
        }

        Behavior on border.width { NumberAnimation{ duration: 100} }
    }

    background: Rectangle {
        x: (control.width  - width) / 2
        y: (control.height - height) / 2

        implicitWidth: control.horizontal ? 200 : 2
        implicitHeight: control.horizontal ? 2 : 200

        width: control.horizontal ? control.availableWidth : implicitWidth
        height: control.horizontal ? implicitHeight : control.availableHeight

        radius: width

        color: control.palette.button
    }
}
