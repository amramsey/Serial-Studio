/*
 * Copyright (c) 2020-2023 Alex Spataru <https://github.com/alex-spataru>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../Widgets" as Widgets

Rectangle {
    id: root
    height: header.implicitHeight + 4 * app.spacing

    //
    // Background & border
    //
    Rectangle {
        id: bg
        anchors.fill: parent
        color: Cpp_ThemeManager.toolbarGradient2
        border.width: Cpp_ThemeManager.titlebarSeparator ? 1 : 0
        border.color: Qt.darker(Cpp_ThemeManager.toolbarGradient2, 1.5)

        Rectangle {
            height: 1
            visible: Cpp_ThemeManager.titlebarSeparator
            color: Qt.darker(Cpp_ThemeManager.toolbarGradient1, 1.5)

            anchors {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }
    }

    //
    // Main layout
    //
    GridLayout {
        id: header
        columns: 2
        rowSpacing: app.spacing
        columnSpacing: app.spacing * 2

        anchors {
            left: parent.left
            right: parent.right
            margins: app.spacing * 2
            verticalCenter: parent.verticalCenter
        }

        //
        // Project title
        //
        RowLayout {
            spacing: app.spacing
            Layout.fillWidth: true

            Widgets.Icon {
                color: Cpp_ThemeManager.menubarText
                source: "qrc:/icons/registration.svg"
            }

            TextField {
                Layout.fillWidth: true
                Layout.minimumWidth: 320
                Layout.maximumHeight: 24
                Layout.minimumHeight: 24
                text: Cpp_Project_Model.title
                onTextChanged: Cpp_Project_Model.setTitle(text)
                placeholderText: qsTr("Project title (required)")

                palette {
                    base: "#fff"
                    text: "#000"
                    //placeholderText: "#444"
                }
            }
        }

        //
        // Separator character
        //
        RowLayout {
            spacing: app.spacing
            Layout.fillWidth: true

            Widgets.Icon {
                color: Cpp_ThemeManager.menubarText
                source: "qrc:/icons/separator.svg"
            }

            TextField {
                Layout.fillWidth: true
                Layout.minimumWidth: 420
                Layout.maximumHeight: 24
                Layout.minimumHeight: 24
                text: Cpp_Project_Model.separator
                onTextChanged: Cpp_Project_Model.setSeparator(text)
                placeholderText: qsTr("Data separator (default is ',')")

                palette {
                    base: "#fff"
                    text: "#000"
                    //placeholderText: "#444"
                }
            }
        }

        //
        // Start sequence
        //
        RowLayout {
            spacing: app.spacing
            Layout.fillWidth: true

            Widgets.Icon {
                color: Cpp_ThemeManager.menubarText
                source: "qrc:/icons/start-sequence.svg"
            }

            TextField {
                Layout.fillWidth: true
                Layout.minimumWidth: 256
                Layout.maximumHeight: 24
                Layout.minimumHeight: 24
                text: Cpp_Project_Model.frameStartSequence
                onTextChanged: Cpp_Project_Model.setFrameStartSequence(text)
                placeholderText: qsTr("Frame start sequence (default is '/*')")

                palette {
                    base: "#fff"
                    text: "#000"
                    //placeholderText: "#444"
                }
            }
        }

        //
        // End sequence
        //
        RowLayout {
            spacing: app.spacing
            Layout.fillWidth: true

            Widgets.Icon {
                color: Cpp_ThemeManager.menubarText
                source: "qrc:/icons/end-sequence.svg"
            }

            TextField {
                Layout.fillWidth: true
                Layout.minimumWidth: 256
                Layout.maximumHeight: 24
                Layout.minimumHeight: 24
                text: Cpp_Project_Model.frameEndSequence
                onTextChanged: Cpp_Project_Model.setFrameEndSequence(text)
                placeholderText: qsTr("Frame end sequence (default is '*/')")

                palette {
                    base: "#fff"
                    text: "#000"
                    //placeholderText: "#444"
                }
            }
        }
    }

    anchors {
        margins: 0
        top: parent.top
        left: parent.left
        right: parent.right
    }
}
