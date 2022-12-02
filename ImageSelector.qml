import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0


ListView {
    id: imgSelector
    spacing: 20
    focus: true

    anchors.fill: parent
    anchors.margins: 20

    signal selected()// i want drawer to be closed after clicked

    delegate: Column{
        width: imgSelector.width
        spacing: 5
        Image {
            fillMode: Image.PreserveAspectFit
            width: parent.width
            source: model.url

            anchors.horizontalCenter: parent.horizontalCenter

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    imgSelector.currentIndex = index
                    selected()

                }
            }
        }//end of the image

        Label{
            text: model.name
            font.bold: index === imgSelector.currentIndex ? true : false
            anchors.horizontalCenter: parent.horizontalCenter
        }//end of label
    }//end of the delegate col

}//end of the ListView
