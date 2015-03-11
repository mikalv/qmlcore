Activity {
	id: mainWindow;
	anchors.fill: renderer;
	anchors.leftMargin: 75;
	anchors.rightMargin: 75;
	anchors.bottomMargin: 40;
	anchors.topMargin: 42;

	ColorTheme { id: colorTheme; }

	MouseArea {
		anchors.fill: renderer;
		hoverEnabled: !parent.hasAnyActiveChild || parent.currentActivity == "infoPanel";

		onMouseXChanged: { 
			if (this.hoverEnabled)
				infoPanel.start();
		}

		onMouseYChanged: {
			if (this.hoverEnabled) 
				infoPanel.start();
		}
	}


	InfoPanel {
		id: infoPanel;
		anchors.fill: parent;
	}

	MenuButton {
		id: menuButton;
		anchors.top: parent.top;
		anchors.left: parent.left;

		onClicked: {
			if (mainMenu.active)
				mainMenu.stop();
			else
				mainMenu.start();
		}
	}

	MainMenu {
		id: mainMenu;
		anchors.left: parent.left;
		anchors.top: menuButton.bottom;
		anchors.topMargin: 20;
		anchors.bottom: parent.bottom;
	}

	onBluePressed: {
		infoPanel.start();
	}

	ChannelsPanel {}
}
