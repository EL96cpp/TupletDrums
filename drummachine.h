#ifndef DRUMMACHINE_H
#define DRUMMACHINE_H

#include <QObject>
#include <AL/alc.h>

class DrumMachine : public QObject
{
    Q_OBJECT
public:
    explicit DrumMachine(QObject *parent = nullptr);

signals:
};

#endif // DRUMMACHINE_H
