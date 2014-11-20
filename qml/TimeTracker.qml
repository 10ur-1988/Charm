import QtQuick 2.2
import QtQuick.Controls 1.1

Screen {
    color: SystemPalette.window

    Rectangle {
        id: listViewArea
        width: parent.width;
        height: parent.height *0.93;
     // visible: screenManager.currentScreen == screenManager.MainScreen

        ScrollView {
            anchors.fill: parent;
            ListView {
                id: listView;
                anchors.fill: parent;
                model: listViewModel;
                delegate: listViewDelegate;
            }
        }

        Component {
            id: listViewDelegate;
            Rectangle {
                anchors { left: parent.left; right: parent.right; }
                height: listView.height / (listViewModel.count-2);
                color: model.color;
                Text {
                    anchors.centerIn: parent;
                    text: model.color;
                }
            }
        }

        ListModel {
            id: listViewModel;
            ListElement { color: "red"; }
            ListElement { color: "orange"; }
            ListElement { color: "yellow"; }
            ListElement { color: "green"; }
            ListElement { color: "deepskyblue"; }
            ListElement { color: "blue"; }
            ListElement { color: "blueviolet"; }
        }
    }

    Rectangle{
        id: toolBarArea
        width: parent.width
        height: parent.height-listViewArea.height
        anchors.top: listViewArea.bottom
        color: SystemPalette.button
    }

    Image {
        id: plusButton
        source: "plusButton.svg"
        sourceSize.height: toolBarArea.height
        sourceSize.width: sourceSize.height
        x: (parent.width-width)/2
        y: parent.height-height-15

        MouseArea {
            anchors.fill: parent
            onClicked:  {console.log(test.sourceSize.height)}
        }
    }

    Image {
        id: menuButton
        source: "menuButton.svg"
        sourceSize.height: toolBarArea.height
        sourceSize.width: sourceSize.height
        x: (parent.width-sourceSize.width*1.5)
        y: parent.height-sourceSize.height-15

        MouseArea {
            anchors.fill: parent
            onClicked: switchScreen(settingsScreen)
        }
    }
}
