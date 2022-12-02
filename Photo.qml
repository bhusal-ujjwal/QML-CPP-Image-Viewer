import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

Image {
    id: photo
    visible: false
    width: parent.width -40
    fillMode: Image.PreserveAspectFit

    Rectangle{
        id: photoFrame
        color: "transparent"
        border.color: "white"
        border.width: 10

        anchors.margins: -10
        anchors.fill: parent

    }//end of the Rectangle

    Component.onCompleted: {
        photo.x = parent.width / 2 - photo.width /2
        photo.y = parent.height / 2 - photo.height /2
        photo.visible = true
    }//end of the Component

    PinchArea{
        anchors.fill: parent
        pinch.target: photo
        pinch.maximumRotation: -360
        pinch.minimumRotation: 360
        pinch.minimumScale: 0.1
        pinch.maximumScale: 10
        pinch.dragAxis: Pinch.XAndYAxis
    }

}
