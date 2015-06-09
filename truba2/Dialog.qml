Activity {
	id: dialogProto;
	signal accepted;
	signal canceled;
	property string okText:	"OK";
	property string cancelText: "Отмена";
	property string title: "";
	property int innerWidth: 500;
	property int innerHeight: 350;
	anchors.left: renderer.left;
	anchors.right: renderer.right;
	width: renderer.width;
	height: renderer.height;
	visible: active;

	MouseArea {
		anchors.fill: parent;
		hoverEnabled: true;
	}

	Rectangle {
		id: innerPanel;
		width: parent.innerWidth;
		height: parent.innerHeight;
		color: colorTheme.backgroundColor;
		anchors.centerIn: parent;
		effects.shadow.blur: 20;
		effects.shadow.spread: 1;

		Text {
			anchors.top: parent.top;
			anchors.topMargin: 10;
			width: parent.width;
			horizontalAlignment: Text.AlignHCenter;
			text: dialogProto.title;
			color: colorTheme.textColor;
			font.pointSize: 24;
		}

		Row {
			anchors.horizontalCenter: parent.horizontalCenter;
			anchors.bottom: parent.bottom;
			anchors.bottomMargin: 10;
			spacing: 10;

			Button {
				text: dialogProto.okText;
				onClicked: { dialogProto.accepted(); }
			}

			Button {
				text: dialogProto.cancelText;
				onClicked: { dialogProto.canceled(); }
			}
		}
	}

	onCanceled: { this.stop(); }
}