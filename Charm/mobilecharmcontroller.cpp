#include "mobilecharmcontroller.h"

MobileCharmController::MobileCharmController(QObject *parent) :
    QObject(parent)
{
}

void MobileCharmController::doSomething(const QString &what)
{
    didSomething("Hello " + what);
}
