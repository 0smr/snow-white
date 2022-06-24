// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.TextArea {
    id: control

    implicitWidth: Math.max(contentWidth + leftPadding + rightPadding,
                            implicitBackgroundWidth + leftInset + rightInset,
                            placeholder.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                             implicitBackgroundHeight + topInset + bottomInset,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6
    leftPadding: padding + 4

    color: control.palette.windowText
    placeholderTextColor: palette.mid
    selectionColor: control.palette.highlight
    selectedTextColor: control.palette.highlightedText

    Text {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width    - (control.leftPadding  + control.rightPadding)
        height: control.height  - (control.topPadding   + control.bottomPadding)

        text: control.placeholderText
        font: control.font

        color: control.placeholderTextColor

        verticalAlignment: control.verticalAlignment
        visible: !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)
        elide: Text.ElideRight
        renderType: control.renderType
    }

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 40

        opacity: control.activeFocus ? 1 : 0.5
        color: Qt.lighter(palette.window, palette.window.hslLightness * 2)

        border.color: Qt.lighter(palette.button, 0.5 + palette.window.hslLightness)
        border.width: 0.5

        Behavior on opacity { NumberAnimation { duration: 100 } }

        Rectangle {
            y: parent.height - height
            height: control.activeFocus ? 3 : 1
            width: parent.width
            color: control.enabled ? control.palette.button : '#aaa'

            Behavior on height { NumberAnimation { duration: 100 } }
        }
    }
}
