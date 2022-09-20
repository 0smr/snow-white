import QtQuick 2.15
import QtQuick.Templates 2.15 as T

T.BusyIndicator {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                                implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    visible: running
    running: false
    padding: 6

    contentItem: ShaderEffect {
        id: effect

        property real strokeWidth: 0.06
        property real sweepAngle: .5
        property color color: control.palette.button

        fragmentShader: "
            varying highp vec2 qt_TexCoord0;
            uniform highp float qt_Opacity;
            uniform highp float sweepAngle;
            uniform highp float strokeWidth;
            uniform highp float width;
            uniform highp vec4 color;

            void main() {
                highp vec2 coord = qt_TexCoord0 - vec2(0.5);
                highp float ring = smoothstep(0.0, 0.5/width, -abs(length(coord) - 0.5 + strokeWidth) + strokeWidth);
                gl_FragColor = color * ring;
                gl_FragColor *= smoothstep(0.0, 0.5/width, -atan(coord.x, coord.y) / 6.2831 - 0.48 + sweepAngle);
            }"
    }

    Timer {
        property real seed: 0
        running: control.running
        repeat: true; interval: 25 // Almost 40Hz
        onTriggered: {
            effect.rotation += 8
            effect.sweepAngle = 0.5 + Math.sin(seed+=0.05) / 3
        }
    }
}
