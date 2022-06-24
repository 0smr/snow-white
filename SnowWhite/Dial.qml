// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls 2.15
import SnowWhite 1.0

T.Dial {
    id: control
    property alias dottedRing: dottedRing

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    background: Item {
        implicitWidth: 184
        implicitHeight: 184

        clip: true

        Rectangle {
            x: (control.availableWidth - width)/2
            y: (control.availableHeight - height)/2

            implicitWidth: parent.width - 20
            implicitHeight: parent.width - 20

            radius: width

            border.color: 'transparent'

            border.width: 1
            color: control.palette.button
        }

        DashedRing {
            id: dottedRing

            x: (control.availableWidth - width)/2
            y: (control.availableHeight - height)/2

            implicitWidth: parent.width - 5
            implicitHeight: parent.width - 5

            borderWidth: 2
            dashWidth: 2
            dashCount: 25
            palette.base: control.palette.button
        }
    }

    handle: Item {
        width: control.width
        height: control.height

        rotation: control.angle * 1.07

        Rectangle {
            x: (parent.width - width)/2
            y: 12
            width: 2; height: 20
            radius: width
            color: control.palette.buttonText
        }
    }
}
