import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

Popup {
    id: dialog
    modal: true
    x: window.width / 2- width /2
    y: window.height * 0.3 - height /2

    padding: 30

    ColumnLayout{
        anchors.fill: parent
        Label{
            text: qsTr("Are you sure??")
        }//end of the label

        RowLayout{
            spacing: 20
            anchors.horizontalCenter: parent

            Button{
                text: qsTr("No")
                highlighted: true
                onClicked: dialog.close()
            }//end of the button no

            Button{
                text: qsTr("Yes")
                onClicked: Qt.quit()
            }//end of the button yes
        }//end of the RowLayout
    }//end of the ColumnLayout
}//end of the popup
