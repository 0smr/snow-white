// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import QtQuick.Controls 2.15
import SnowWhite 1.0

T.Button {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                                implicitContentHeight + topPadding + bottomPadding)

    property alias radius: background.radius

    padding: 6
    spacing: 6

    icon.width: 24
    icon.height: 24
    icon.color: palette.buttonText

    display: AbstractButton.TextOnly

    contentItem: Item {
        Grid {
            anchors.centerIn: parent
            spacing: control.display == AbstractButton.TextOnly ||
                     control.display == AbstractButton.IconOnly ? 0 : control.spacing

            flow: control.display == AbstractButton.TextUnderIcon ?
                      Grid.TopToBottom : Grid.LeftToRight
            layoutDirection: control.mirrored ? Qt.RightToLeft : Qt.LeftToRight

            opacity: control.down || control.checked ? 0.8 : 1.0

            Image {
                visible: control.display != AbstractButton.TextOnly
                source: control.icon.source
                width: control.icon.width
                height: control.icon.height
                cache: control.icon.cache
            }

            Text {
                visible: control.display != AbstractButton.IconOnly
                text: control.text
                font: control.font
                color: !control.enabled ? 'gray' :
                    control.highlighted ? palette.highlightedText :
                                          palette.buttonText
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    background: Rectangle {
        id: background
        visible: control.enabled

        implicitWidth: 45
        implicitHeight: 45

        radius: width * 0.2
        opacity: control.flat ? 0.5 : 1.0

        color: {
            const  _color =  control.highlighted ? palette.highlight : palette.button
            control.down ? Qt.lighter(_color, 1.1) : _color
        }

        border {
            width: control.visualFocus ? 1 :0
            color: palette.windowText
        }

        Behavior on border.width { NumberAnimation { duration: 75 } }

        Rectangle {
            x: (parent.width - width)/2
            y: (parent.height - height)/2
            radius: parent.radius - 0.05
            visible: control.checked
            color: 'transparent'
            border {
                color: palette.buttonText
                width: 1
            }

            NumberAnimation on width {
                running: control.checked
                from: control.background.width
                to: control.background.width - 5
            }

            NumberAnimation on height {
                running: control.checked
                from: control.background.height
                to: control.background.height - 5
            }
        }
    }
}
