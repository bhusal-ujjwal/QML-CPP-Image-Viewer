#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickStyle>
#include <QQmlContext>
#include "main.h"



int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    ImageStorage data;

#ifdef Q_OS_WIN32
    QQuickStyle::setStyle("Material");
#else
    QQuickStyle::setStyle("Universal");
#endif

    QQmlApplicationEngine engine;
    //connection with the QML
    engine.rootContext()-> setContextProperty("pictures",QVariant::fromValue(data.images()));

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}


//initiating my images in Qlist with constructor
ImageStorage::ImageStorage(){
    m_images.append(new Image("Best Friend", "qrc:/images/pictures/pic1.jpg"));
    m_images.append(new Image("Nature", "qrc:/images/pictures/pic2.jpg"));
    m_images.append(new Image("Nebula", "qrc:/images/pictures/pic3.jpg"));

}
