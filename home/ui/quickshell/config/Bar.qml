// Bar.qml
import Quickshell
import QtQuick

Scope {
  Variants {
    model: Quickshell.screens

    PanelWindow {
      property var modelData
      screen: modelData
      color : "#1e1e2e"

      anchors {
        top: true
        left: true
        right: true
      }

      implicitHeight: 30

      Row{
        ClockWidget {
        color: "white"
      }
      }

    }
  }
}