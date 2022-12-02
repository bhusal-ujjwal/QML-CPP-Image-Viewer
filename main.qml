import QtQuick 2.7
import QtQuick.Window 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

ApplicationWindow {
    id: window
    width: 600
    height: 800
    visible: true
    title: qsTr("Image Viewer")

    Material.primary: "steelblue"
    Material.background: "lightgrey"
    Universal.background: "lightgrey"

    header: ToolBar{
        id: mainToolbar
        Material.foreground: "white"

        RowLayout{
            anchors.fill: parent
            spacing: 20
            ToolButton{
                contentItem: Image{
                    fillMode: Image.Pad
                    source: "qrc:/images/drawer.png"
                }

                onClicked: mainDrawer.open();

            }//end of the toolbutton

            Label{
                text: pictures[imgSelector.currentIndex].name
                horizontalAlignment: Qt.AlignHCenter
                font.pointSize: 14
                font.bold: true
                Layout.fillWidth: true

            }//end of the label

            ToolButton {
                contentItem: Image{
                    fillMode: Image.Pad
                    source: "qrc:/images/menu.png"
                }
                onClicked: mainMenu.open()
                Menu{
                    id: mainMenu
                    y: mainToolbar.height
                    x: mainToolbar.width

                    MenuItem{
                        text: qsTr("Quit")
                        onTriggered: messageDialog.open()
                    }
                }//end of the menu
            }//end of the toolbutton

        }//end of the row layout
    }//end of the header

    QuitDialog{
        id: messageDialog

    }//end of the  quit dialog

    Drawer{
        id: mainDrawer
        width: window.width * 0.6
        height: window.height

        ImageSelector{
            id: imgSelector
            model: pictures

            onSelected: mainDrawer.close()


        }//end of the ImageSelector
    }//end of the drawer

    Photo{
        source: pictures[imgSelector.currentIndex].url
    }


}
