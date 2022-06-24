// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.BusyIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 6
    running: false

    component RSemiCircle : Item {
        property real borderWidth: 2
        property real speed: 1
        property color color: control.palette.button

        x: (parent.width - width)/2
        y: (parent.height - height)/2

        width: 10
        height: width

        Item {
            width: parent.width/2
            height: parent.width
            clip: true

            Rectangle {
                width: parent.height; height: width
                radius: width
                color: 'transparent'
                border.width: borderWidth
                border.color: parent.parent.color
            }
        }

        NumberAnimation on rotation {
            running: control.running
            from: speed < 0 ? 360 : 0
            to: speed < 0 ? 0 : 360
            duration: 4000/Math.max(1, Math.abs(speed))
            loops: NumberAnimation.Infinite
        }
    }

    contentItem: Item {
        implicitWidth: 25
        implicitHeight: 25

        RSemiCircle {
            width: parent.width
            speed: 1
        }

        RSemiCircle {
            width: parent.width - 5
            speed: -4
            color: control.palette.highlight
        }

        RSemiCircle {
            width: parent.width - 10
            speed: 16
        }

        width: control.width
        height: control.height
    }
}
