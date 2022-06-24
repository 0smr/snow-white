// Copyright (C) 2022 smr.
// SPDX-License-Identifier: LGPL-3.0-only
// http://s-m-r.ir

import QtQuick 2.15
import QtQuick.Templates 2.15  as T

T.ProgressBar {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    property int orientation: Qt.Horizontal
    padding: 2

    QtObject {
        id: orient
        property bool vertical: control.orientation == Qt.Vertical
        property bool horizontal: control.orientation == Qt.Horizontal
    }

    contentItem: Item {
        Rectangle {
            x: 2
            y: (parent.height - height)/2
            width: control.position * (parent.width - 4)
            height: Math.min(width, parent.height - 4)

            radius: Math.max(width, height)
            color: control.palette.button
        }
    }

    background: Rectangle {
        implicitWidth: orient.horizontal ? 200 : 18
        implicitHeight: orient.vertical ? 200 : 18

        color: 'transparent'
        radius: width

        border {
            color: control.palette.button
            width: 2
        }
    }
}
