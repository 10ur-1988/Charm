import QtQuick 2.0
import QtQuick.Controls 1.1

Screen {
    color: SystemPalette.window

    Image {
        id : homeButton
        source: "qrc:///Icons/android/homeButton.svg"
        sourceSize.height: parent.height/15
        sourceSize.width: sourceSize.height
        x: (parent.width-width)/2
        y: parent.height-height-15
        MouseArea {
           anchors.fill: parent
           onClicked: switchScreen(timeTracker);
        }
    }

    Image {
        id : databaseButton
        source: "qrc:///Icons/android/databaseButton.svg"
        sourceSize.width: parent.width/4
        MouseArea {
           anchors.fill: parent
           onClicked: switchScreen(timeTracker);
        }
    }
    Image {
        id : calendarButton
        source: "qrc:///Icons/android/calendarButton.svg"
        anchors.left: databaseButton.right
        sourceSize.width: parent.width/4
        MouseArea {
           anchors.fill: parent
           onClicked: switchScreen(timeTracker);
        }
    }

}

