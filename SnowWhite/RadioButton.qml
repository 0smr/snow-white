// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import SnowWhite 1.0

T.RadioButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                            implicitContentHeight + topPadding + bottomPadding,
                            implicitIndicatorHeight + topPadding + bottomPadding)

    padding: 6
    spacing: 6

    indicator: Rectangle {
        implicitWidth:  25
        implicitHeight: 25

        x: control.text ?
               (control.mirrored ?
                    control.width - width - control.rightPadding :
                    control.leftPadding) :
               control.leftPadding + (control.availableWidth - width) / 2

        y: control.topPadding + (control.availableHeight - height) / 2

        radius: width

        color: 'transparent'

        border {
            color: control.visualFocus ? control.palette.highlight : control.palette.button
            width: 2
        }

        Rectangle {
            id: ibox
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2

            width: control.checked ? parent.width - 8 : 0
            height: width

            color: palette.button

            radius: width

            Behavior on width {
                NumberAnimation { duration: 100 }
            }
        }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        verticalAlignment: Text.AlignVCenter
        color: palette.windowText
        text: control.text
        font: control.font
    }
}
