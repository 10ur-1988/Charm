//#include <QApplication>
//#include <QQmlApplicationEngine>

#include <QtGui/QGuiApplication>
#include <QtQml/QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine(QUrl("qrc:///qml/MainScreen.qml"));

    return app.exec();
}
