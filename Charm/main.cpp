#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QSettings>

#include "CharmConstants.h"
#include "CharmDataModel.h"
#include "Controller.h"
#include "EventModelAdapter.h"

class Application : public QGuiApplication
{
    Q_OBJECT

public:
    Application(int &argc, char **argv)
        : QGuiApplication(argc, argv)
    {
        // note that this modifies the behaviour of QSettings:
        setOrganizationName("KDAB");
        setOrganizationDomain("kdab.com");
        setApplicationName("Charm");
        setApplicationVersion(CHARM_VERSION);

        connectControllerAndModel(&m_controller, &m_dataModel);
    }

    int run()
    {
        if (not readConfiguration()) {
            qWarning("Could not read configuration");
            return EXIT_FAILURE;
        }

        if (not m_controller.initializeBackEnd(CHARM_SQLITE_BACKEND_DESCRIPTOR)) {
            qWarning("Could not initialize to backend");
            return EXIT_FAILURE;
        }

        if (not m_controller.connectToBackend()) {
            qWarning("Could not connect to backend");
            return EXIT_FAILURE;
        }

        QQmlApplicationEngine engine;
        EventModelAdapter events(&m_dataModel);
        m_dataModel.registerAdapter(&events);
        engine.rootContext()->setContextProperty("_events", &events);
        engine.load(QUrl("qrc:///qml/MainScreen.qml"));

        m_controller.updateModelEventsAndTasks();

        return exec();
    }

private:
    bool readConfiguration()
    {
        // TODO: detect empty config file and generate something like this if needed:
        //
        // [debug]
        // InstallationId=1
        // LocalStorageDatabase=/home/onur/.local/share/KDAB/Charm/Charm-Android.db
        // LocalStorageType=sqlite
        // UserId=1
        //
        // see Application::configure() -> if (!configurationComplete || CONFIGURATION.failure)
        //
        QSettings settings;

        qDebug("Reading configuration from group %s of %s",
               qPrintable(settings.fileName()),
               qPrintable(CONFIGURATION.configurationName));

        settings.beginGroup(CONFIGURATION.configurationName);
        return CONFIGURATION.readFrom(settings);
    }

private:
    CharmDataModel m_dataModel;
    Controller m_controller;
};

int main(int argc, char *argv[])
{
    return Application(argc, argv).run();
}

#include "main.moc"
