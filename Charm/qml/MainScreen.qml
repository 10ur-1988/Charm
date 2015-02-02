import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

import QtSensors 5.0
import QtSensors 5.2

ApplicationWindow {
    id: mainWindow
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    visible: true
    title: qsTr("Charm Time Tracker")

    property var durationSpeed: 750

    Item {
        id: screenManager
        property var currentScreen: timeTracker
        onCurrentScreenChanged: console.log("current screen:", currentScreen, currentScreen.objectName)
        anchors.fill: parent


        TimeTracker {
            id: timeTracker
            x: (screenManager.currentScreen === timeTracker) ? 0 : -mainWindow.width
            Behavior on x { NumberAnimation { duration: durationSpeed }}

            visible: x !== -mainWindow.width
        }

        SettingScreen {
            id: settingsScreen
            x: (screenManager.currentScreen === settingsScreen) ? 0 : mainWindow.width
            Behavior on x { NumberAnimation { duration:  durationSpeed }}

            visible: x !== mainWindow.width
        }

        /*
        Button {
            text: test
            onClicked: _controller.doSomething("World")
        }

        Connections {
            target: _controller
            onDidSomething: console.log(what);
        }
        */
    }
}
