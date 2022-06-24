// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.CheckBox {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding,
                             implicitIndicatorHeight + topPadding + bottomPadding,
                             indicator.height + topPadding + bottomPadding)
    padding: 6
    spacing: 6

    indicator: Rectangle {
        implicitWidth: 25
        implicitHeight: 25

        x: control.text ?
               (control.mirrored ?
                    control.width - width - control.rightPadding :
                    control.leftPadding) :
               control.leftPadding + (control.availableWidth - width) / 2

        y: control.topPadding + (control.availableHeight - height) / 2

        radius: 5

        color: 'transparent'

        border {
            color: control.visualFocus ? control.palette.highlight : control.palette.button
            width: 2
        }

        Rectangle {
            id: ibox
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2

            color: control.palette.button

            radius: 3

            states:[
                State {
                    when: control.checkState === Qt.Checked
                    PropertyChanges {
                        target: ibox
                        width: control.indicator.width - 8
                        height: control.indicator.height - 8
                    }
                },
                State {
                    when: control.checkState === Qt.Unchecked
                    PropertyChanges { target: ibox; width: 0; height: 0 }
                },
                State {
                    when: control.checkState === Qt.PartiallyChecked
                    PropertyChanges {
                        target: ibox
                        width: control.indicator.width - 8
                        height: control.indicator.height/3
                    }
                }
            ]

            transitions: [
                Transition {
                    from: "*"
                    to: "*"
                    NumberAnimation { properties: "width, height"; duration: 100 }
                }
            ]
        }
    }

    contentItem: Text {
        leftPadding: control.indicator && !control.mirrored ? control.indicator.width + control.spacing : 0
        rightPadding: control.indicator && control.mirrored ? control.indicator.width + control.spacing : 0
        verticalAlignment: Text.AlignVCenter
        text: control.text
        font: control.font
        color: control.palette.windowText
    }
}
