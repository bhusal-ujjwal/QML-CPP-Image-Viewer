#ifndef MAIN_H
#define MAIN_H

#include <QObject>

//creating the image class so later to be connected to the QML
class Image :public QObject{
    Q_OBJECT

    QString  m_name;
    QString m_url;

public:
    //creating the QProperty
    Q_PROPERTY(QString name READ name WRITE setName NOTIFY nameChanged)
    Q_PROPERTY(QString url READ url WRITE setUrl NOTIFY urlChanged)

    //constructor of the class
    Image(const QString &name, const QString &url): m_name(name), m_url(url) {;}

    QString name() const{
        return m_name;
    }

    QString url() const{
        return m_url;
    }

public slots:
    void setName(QString name){
        if(m_name==name)
            return;

        m_name = name;
        emit nameChanged(name);
    }

    void setUrl(QString url){
        if(m_url==url)
            return;

        m_url = url;
        emit urlChanged(url);
    }


signals:
    void nameChanged(QString name);
    void urlChanged(QString url);


};//end of the class


//define image storage class because unages are going to be like a list
class ImageStorage: public QObject{
    Q_OBJECT

    QList<QObject*> m_images;

public:
    ImageStorage();

    QList<QObject*> images(){
        return m_images;

    }


};

#endif // MAIN_H
