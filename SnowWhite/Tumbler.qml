// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.Tumbler {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    font.pixelSize: 12
    palette.text: "gray"

    delegate: Text {
        text: modelData
        color: control.visualFocus ? control.palette.highlightedText : control.palette.buttonText
        font: control.font
        opacity: 0.4 + Math.max(0, 1 - Math.abs(Tumbler.displacement)) * 0.6
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
//        Rectangle {anchors.fill: parent;border.width: 1; color: 'transparent'}
    }

    contentItem: PathView {
        id: pathview
        preferredHighlightBegin: 0.5
        preferredHighlightEnd: 0.5
        highlightRangeMode: PathView.StrictlyEnforceRange
        implicitWidth: 60
        implicitHeight: 80
        clip: true
        model: control.model
        delegate: control.delegate
        pathItemCount: control.visibleItemCount
        path: Path {
            startX: control.availableWidth / 2
            startY: 0
            PathLine {
                x: control.availableWidth / 2
                y: control.availableHeight
            }
        }
    }

    background: Rectangle {
        implicitWidth: 60
        implicitHeight: 80
        radius: 5
        color: control.palette.button

        Rectangle {
            y: (parent.height - height)/2
            x: (parent.width - width)/2
            width: parent.width * 0.7
            height: control.currentItem.height
            radius: 3
            opacity: Math.abs(pathview.offset % 1 - 0.5) * 2
            border.width: 1
            border.color: control.palette.window
            color: 'transparent'
        }
    }
}
