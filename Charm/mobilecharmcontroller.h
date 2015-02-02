#ifndef MOBILECHARMCONTROLLER_H
#define MOBILECHARMCONTROLLER_H

#include <QObject>

class MobileCharmController : public QObject
{
    Q_OBJECT
public:
    explicit MobileCharmController(QObject *parent = 0);

    Q_INVOKABLE void doSomething(const QString &what);

signals:
    void didSomething(const QString &what);
};

#endif // MOBILECHARMCONTROLLER_H
