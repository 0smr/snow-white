// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtQuick.Templates 2.15  as T

T.ComboBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                            implicitContentHeight + topPadding + bottomPadding,
                            implicitIndicatorHeight + topPadding + bottomPadding)
    leftPadding: 5 + (!control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    rightPadding: 5 + (control.mirrored || !indicator || !indicator.visible ? 0 : indicator.width + spacing)
    spacing: 5

    delegate: ItemDelegate {
        width: ListView.view.width
        text: control.textRole ? (Array.isArray(control.model) ? modelData[control.textRole] : model[control.textRole]) : modelData
        palette.text: control.palette.buttonText
        palette.highlightedText: control.palette.highlightedText
        hoverEnabled: control.hoverEnabled

        background: Rectangle {
            radius: 5
            color: control.palette.button
            opacity: control.currentIndex === index || hovered ? 1 : 0.7
            border.width: visualFocus ? 2 : 1
            border.color: control.palette.buttonText

            Behavior on opacity { NumberAnimation { duration: 100 } }

            Rectangle {
                x: parent.width * 0.9
                y: (parent.height - height)/2
                width: 5; height: 5; radius: width
                color: control.palette.buttonText
                visible: control.currentIndex === index
            }
        }
    }

    indicator: Text {
        x: control.mirrored ? control.padding : control.availableWidth + control.spacing + 4
        y: control.topPadding + (control.availableHeight - height)/2
        width: implicitWidth
        color: control.palette.buttonText
        text: "\u2261"
        font.pixelSize: 12
        font.bold: true
        opacity: enabled ? 1 : 0.3
    }

    contentItem: T.TextField {
        leftPadding: !control.mirrored ? 12 : 13
        rightPadding: control.mirrored ? 12 : 13
        topInset: 5; bottomInset: 5
        text: control.editable ? control.editText : control.displayText

        enabled: control.editable
        autoScroll: control.editable
        readOnly: !control.editable
        inputMethodHints: control.inputMethodHints
        validator: control.validator
        selectByMouse: control.selectTextByMouse

        font: control.font
        color: control.palette.windowText
        selectionColor: control.palette.highlight
        selectedTextColor: control.palette.highlightedText
        verticalAlignment: Text.AlignVCenter

        background: Rectangle {
            visible: control.enabled && control.editable && !control.flat
            color: control.palette.window
            opacity: parent.activeFocus && control.editable ? 0.9 : 0.6
            radius: 2
            Behavior on opacity { NumberAnimation { duration: 100 } }
        }
    }

    background: Rectangle {
        implicitWidth: 140
        implicitHeight: 40

        visible: !control.flat || control.down
        radius: 5
        color: control.palette.button
        opacity: control.down ? 0.8 : 1.0

        Behavior on opacity { NumberAnimation { duration: 100 } }
    }

    popup: T.Popup {
        y: control.height
        topPadding: 2
        width: control.width
        height: Math.min(contentItem.implicitHeight, control.Window.height - y - control.y) + 2

        contentItem: ListView {
            clip: true
            implicitHeight: contentHeight
            model: control.delegateModel
            spacing: 2
            currentIndex: control.highlightedIndex
            highlightMoveDuration: 0
            T.ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
}
