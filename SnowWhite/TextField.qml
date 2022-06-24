// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.TextField {
    id: control

    implicitWidth: implicitBackgroundWidth + leftInset + rightInset
                   || Math.max(contentWidth, placeholder.implicitWidth) + leftPadding + rightPadding
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             contentHeight + topPadding + bottomPadding,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    padding: 6
    leftPadding: padding + 4

    color: control.palette.windowText
    selectionColor: control.palette.highlight
    selectedTextColor: control.palette.highlightedText
    placeholderTextColor: control.palette.text
    verticalAlignment: TextInput.AlignVCenter

    Text {
        id: placeholder
        x: control.leftPadding
        y: control.topPadding
        width: control.width - (control.leftPadding  + control.rightPadding)
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
            height: parent.height
            width: control.activeFocus ? 3 : 1

            color: control.enabled ? control.palette.button : '#00000055'

            Behavior on width { NumberAnimation { duration: 100 } }
        }
    }
}
