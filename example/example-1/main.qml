import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import Qt.labs.settings 1.1

import SnowWhite 1.0

ApplicationWindow {
    id: window

    width: toggleButton.checked ? scrollView.contentWidth : 230
    height: 420
    visible: true

    palette {
        base: "#48abff"
        button: "#48abff"
        highlight: "#5c75f4"

        window: '#333'
        text: "#eee"
        windowText: "#eee"

        buttonText: "#fff"
        highlightedText: "#fff"
    }

    component ButtonColor: Button {
        width: 20; height: width
        onClicked: {
            window.palette.base = palette.button
            window.palette.button = palette.button
            window.palette.highlight = Qt.darker(palette.button, 1.5)
        }
    }

    component BackColor: Button {
        width: 20; height: width
        onClicked: {
            window.palette.window = palette.button
            window.palette.windowText = palette.buttonText
        }
    }

    FontLoader {
        id: carlito
        source: "resources/Carlito-Regular.ttf"
    }

    Settings {
        id: settings
        fileName: 'config.conf'
        property alias toggleButton: toggleButton.checked
        property real xScroll: scrollView.xScroll
    }

    Row {
        x: 5; z: 3; spacing: 2
        AbstractButton {
            id: toggleButton
            width: 15; height: 15
            checkable: true
            font.family: 'Cascadia Code Light'
            contentItem: Text {
                text: parent.checked ? '▶◀' : '◀▶'
                color: palette.button
            }
        }
        ButtonColor { palette.button: '#48abff'; text: '.' }
        ButtonColor { palette.button: '#ef476f'; text: '.' }
        ButtonColor { palette.button: '#ffd166'; text: '.' }
        ButtonColor { palette.button: '#06d6a0'; text: '.' }
        ButtonColor { palette.button: '#d5b9ff'; text: '.' }
        ButtonColor { palette.button: '#343536'; text: '.' }
        ButtonColor { palette.button: '#edc9aa'; text: '.' }
        Rectangle { color: window.palette.windowText ;width: 1; height: parent.height }
        BackColor { palette {button: '#f5f6f7'; buttonText: '#343536'} text: '.' }
        BackColor { palette {button: '#343536'; buttonText: '#f5f6f7'} text: '.' }
        BackColor { palette {button: '#1d1c21'; buttonText: '#ffffff'} text: '.' }
    }

    ScrollView {
        id: scrollView

        property real xScroll: ScrollBar.horizontal.position
        Component.onCompleted: ScrollBar.horizontal.position = settings.xScroll

        anchors.fill: parent

        contentWidth: 690
        contentHeight: height

        Grid {
            flow: Grid.LeftToRight

            rows: flow == Grid.LeftToRight ? 1 : -1
            columns: flow == Grid.LeftToRight ? -1 : 1

            padding: 25
            spacing: 25

            Column {
                spacing: 10
                Frame {
                    Grid {
                        rows: -1
                        columns: 3
                        spacing: 10
                        Button {
                            width: 55
                            height: width
                            text: "Color\npicker"
                            font.family: carlito.name
                            onClicked: colorPickerW.visible = true
                        }

                        Button {
                            width: 55
                            height: width
                            text: "HL\nBtn"
                            highlighted: true
                            font { family: carlito.name; weight: Font.Medium; }
                        }

                        Button {
                            width: 55
                            height: width
                            text: "Check\nBtn"
                            checkable: true
                            font.family: carlito.name
                        }

                        Button {
                            width: 55
                            height: width
                            text: "Flat Btn"
                            flat: true
                            font.family: carlito.name
                        }

                        Button {
                            width: 40
                            height: width
                            text: "Disabled\nBtn"
                            enabled: false
                            font.family: carlito.name
                        }

                        Button {
                            width: 40
                            height: width
                            highlighted: true
                            text: "w-40"
                            font.family: carlito.name
                        }
                    }
                }

                Button {
                    width: parent.width
                    height: 45
                    text: "Wide Checkable Button"
                    checkable: true
                    font.family: carlito.name
                    radius: 10
                }

                Row {
                    CheckBox {
                        text: "Check\nbox"
                        tristate: true
                        font.family: carlito.name
                    }

                    Switch {
                        text: "Switch"
                        font.family: carlito.name
                    }
                }

                Row {
                    RadioButton {
                        text: "Radio 1"
                        font.family: carlito.name
                    }

                    RadioButton {
                        text: "Radio 2"
                        font.family: carlito.name
                    }
                }

                Row {
                    spacing: 5

                    Text {
                        height: 85
                        text: "Busy Indicator \u2192"
                        color: window.palette.windowText
                        verticalAlignment: Text.AlignVCenter
                        font { family: carlito.name }
                    }

                    Rectangle {
                        width: 85; height: 85
                        color: 'transparent'
                        radius: 6
                        border.width: 1
                        border.color: Qt.darker(window.palette.base, 1.1)

                        BusyIndicator {
                            anchors.centerIn: parent
                            width: 30
                            height: 30
                            running: false
                            visible: true

                            MouseArea {
                                anchors.fill: parent
                                onClicked: parent.running ^= true
                            }
                        }
                    }
                }
            }

            Rectangle {
                width: 1
                height: window.height - 45
                color: '#000'
                opacity: 0.1
            }

            Column {
                spacing: 7

                ProgressBar {
                    width: 180;
                    value: slider1.value
                }

                Slider {
                    id: slider1
                    width: 180;
                    value: 0.3
                }

                RangeSlider {
                    width: 180;
                }

                SpinBox {
                    font.family: carlito.name
                    to: 10
                }

                Column {
                    spacing: 10
                    TextArea {
                        width: 180
                        text: 'Simple example of \nTextArea.'
                        font.family: carlito.name
                    }

                    TextField {
                        width: 180
                        text: 'Example text field.'
                        font.family: carlito.name
                    }
                }
            }

            Rectangle {
                width: 1
                height: window.height - 45
                color: '#000'
                opacity: 0.1
            }

            Column {
                spacing: 5
                Text {
                    width: parent.width
                    text: "Dial"
                    color: window.palette.windowText
                    horizontalAlignment: Text.AlignHCenter
                    font.family: carlito.name
                }

                Dial {
                    x: (parent.width - width)/2
                    width: 100
                    height: 100
                }

                Text {
                    topPadding: 10
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter

                    text: "Tumbler"
                    color: window.palette.windowText
                    font.family: carlito.name
                }

                Tumbler {
                    x: (parent.width - width)/2
                    model: 40
                    height: 75
                    visibleItemCount: 3
                }

                Text {
                    topPadding: 10
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "ComboBox"
                    color: window.palette.windowText
                    font.family: carlito.name
                }


                ComboBox {
                    id: comboBox
                    model: 5
                    editable: true
                }
            }
        }
    }

    Window {
        id: colorPickerW
        ColorPicker {
            id: colorPicker;
            onSelectedColorChanged: {
                window.palette.base = selectedColor
                window.palette.button = selectedColor
                window.palette.highlight = Qt.darker(selectedColor, 1.5)
                window.palette.buttonText = selectedColor.hslLightness < 0.7 ? '#fff' : '#333'
            }
        }
        title: ''
        flags: Qt.Tool
        minimumWidth: colorPicker.width
        minimumHeight:  200
    }
}
