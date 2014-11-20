import QtQuick 2.2

Rectangle {
    width: parent.width
    height: parent.height

    function switchScreen(target) {
        screenManager.currentScreen = target;
    }
}
