import QtQuick 2.2
import QtQuick.Controls 1.1


Screen {
    color: CharmStyle.window

    Rectangle {
        id: listViewArea
        width: parent.width;
        height: parent.height *0.9;

     // visible: screenManager.currentScreen !== screenManager.MainScreen
        ScrollView {
            anchors.fill: parent;
            ListView {
                id: listView;
                anchors.fill: parent;
                model: _events;
                delegate: Rectangle {
                    id: taskViewArea
                    anchors { left: parent.left; right: parent.right; }
                    height: listView.height/8;
                    color: model.color;
                    Text {
                        anchors.centerIn: parent
                        width: parent.width
                        //font.pointSize: 25
                        elide: Text.ElideLeft;
                        text: [ model.display , model.taskName ].join(" ");
                    }
                }
            }
        }
    }




/************************************************************************************
    Rectangle{
        id: listViewArea
        width: parent.width;
        height: parent.height *0.9;
        ScrollView {
            anchors.fill: parent;
            ListView{
                anchors.fill: parent;
                model: _events;
                Component{
                    id: listViewDelegate
                    Rectangle{
                        anchors { left: parent.left; right: parent.right; }
                        height: listView.height/8;
                        Text {
                            text: [model.display ,model.taskName].join("-");
                        }
                    }
                }
                delegate: listViewDelegate
            }
        }
    }

***********************************************************************************/

    Rectangle {
        id: toolBarArea
        width: parent.width
        height: parent.height-listViewArea.height
        anchors.top: listViewArea.bottom
        color: CharmStyle.button
    }

    Image {
        id: plusButton
        //source:"plusButton.svg"
        source: "qrc:///Icons/android/plusButton.svg"
        sourceSize.height: toolBarArea.height
        sourceSize.width: sourceSize.height
        x:(parent.width-width)/2
        y:parent.height-height

        MouseArea {
            anchors.fill: parent
            //onClicked:  {console.log(test.sourceSize.height)}
            onClicked: {}
        }
    }

    Image {
        id: menuButton
        //source: "menuButton.svg"
        source: "qrc:///Icons/android/menuButton.svg"
        sourceSize.height: toolBarArea.height
        sourceSize.width: sourceSize.height
        x: (parent.width-sourceSize.width*1.5)
        y: parent.height-sourceSize.height

        MouseArea {
            anchors.fill: parent
            onClicked: switchScreen(settingsScreen)
        }
    }
}
