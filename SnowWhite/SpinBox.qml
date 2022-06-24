// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir


import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.SpinBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            contentItem.implicitWidth + 2 * padding +
                            up.implicitIndicatorWidth +
                            down.implicitIndicatorWidth)
    implicitHeight: Math.max(implicitContentHeight + topPadding + bottomPadding,
                             implicitBackgroundHeight,
                             up.implicitIndicatorHeight,
                             down.implicitIndicatorHeight)

    padding: 6
    leftPadding: padding + (control.mirrored ? (up.indicator ? up.indicator.width : 0) : (down.indicator ? down.indicator.width : 0))
    rightPadding: padding + (control.mirrored ? (down.indicator ? down.indicator.width : 0) : (up.indicator ? up.indicator.width : 0))
    font.bold: true

    component Indicator: Text {
        width: 30; height: parent.height

        font.pointSize: 10
        font.bold: true

        color: control.palette.button
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    validator: IntValidator {
        locale: control.locale.name
        bottom: Math.min(control.from, control.to)
        top: Math.max(control.from, control.to)
    }

    contentItem: TextInput {
        text: control.displayText

        font: control.font
        color: control.palette.button
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        readOnly: !control.editable
        validator: control.validator
        inputMethodHints: control.inputMethodHints

        Rectangle {
            y: parent.height - height
            width: parent.width
            height: parent.readOnly ? 0 : 1
            color: control.palette.button
        }
    }

    up.indicator: Indicator {
        x: control.mirrored ? 0 : parent.width - width
        text: "+";
        opacity: !enabled || control.up.pressed ? 0.4 : 1
    }

    down.indicator: Indicator {
        x: control.mirrored ? parent.width - width : 0
        text: "-";
        opacity: !enabled || control.down.pressed ? 0.4 : 1
    }


    background: Rectangle {
        id: background
        implicitWidth: 80
        implicitHeight: 30

        radius: 5
        color: 'transparent'
        border.width: 2
        border.color: control.palette.button
    }
}
