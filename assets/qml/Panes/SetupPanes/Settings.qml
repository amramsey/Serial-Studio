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

Control {
    id: root

    //
    // Access to properties
    //
    property alias tcpPlugins: _tcpPlugins.checked
    property alias language: _langCombo.currentIndex
    property alias windowShadows: _windowShadows.checked

    //
    // Layout
    //
    ColumnLayout {
        id: layout
        anchors.fill: parent
        anchors.margins: app.spacing

        //
        // Controls
        //
        GridLayout {
            columns: 2
            Layout.fillWidth: true
            rowSpacing: app.spacing
            columnSpacing: app.spacing

            //
            // Language selector
            //
            Label {
                text: qsTr("Language") + ":"
            } ComboBox {
                id: _langCombo
                Layout.fillWidth: true
                currentIndex: Cpp_Misc_Translator.language
                model: Cpp_Misc_Translator.availableLanguages
                onCurrentIndexChanged: {
                    if (currentIndex !== Cpp_Misc_Translator.language)
                        Cpp_Misc_Translator.setLanguage(currentIndex)
                }
            }

            //
            // Theme selector
            //
            Label {
                text: qsTr("Theme") + ":"
            } ComboBox {
                id: _themeCombo
                Layout.fillWidth: true
                model: Cpp_ThemeManager.availableThemes
                currentIndex: Cpp_ThemeManager.themeId
                onCurrentIndexChanged: {
                    if (currentIndex !== Cpp_ThemeManager.themeId)
                        Cpp_ThemeManager.setTheme(currentIndex)
                }
            }

            //
            // Plugins enabled
            //
            Label {
                text: qsTr("Plugin system") + ": "
            } Switch {
                id: _tcpPlugins
                Layout.leftMargin: -app.spacing
                Layout.alignment: Qt.AlignLeft
                checked: Cpp_Plugins_Bridge.enabled
                onCheckedChanged: {
                    if (checked !== Cpp_Plugins_Bridge.enabled)
                        Cpp_Plugins_Bridge.enabled = checked
                }
            }

            //
            // Custom window decorations
            //
            Label {
                text: qsTr("Custom window decorations") + ": "
            } Switch {
                id: _windowShadows
                Layout.leftMargin: -app.spacing
                Layout.alignment: Qt.AlignLeft
                checked: Cpp_ThemeManager.customWindowDecorations
                onCheckedChanged: {
                    if (checked != Cpp_ThemeManager.customWindowDecorations)
                        Cpp_ThemeManager.customWindowDecorations = checked
                }
            }

            //
            // Software rendering
            //
            Label {
                text: qsTr("Software rendering") + ": "
            } Switch {
                id: _softwareRendering
                Layout.leftMargin: -app.spacing
                Layout.alignment: Qt.AlignLeft
                checked: Cpp_ModuleManager.softwareRendering
                onCheckedChanged: {
                    if (checked !== Cpp_ModuleManager.softwareRendering)
                        Cpp_ModuleManager.setSoftwareRenderingEnabled(checked)
                }
            }
        }

        //
        // Plugins label
        //
        Label {
            opacity: 0.8
            font.pixelSize: 12
            Layout.fillWidth: true
            wrapMode: Label.WrapAtWordBoundaryOrAnywhere
            color: Cpp_ThemeManager.highlightedTextAlternative
            text: qsTr("Applications/plugins can interact with %1 by " +
                       "establishing a TCP connection on port 7777.").arg(Cpp_AppName)
        }

        //
        // Vertical spacer
        //
        Item {
            Layout.fillHeight: true
        }
    }
}
