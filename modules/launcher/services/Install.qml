pragma Singleton

import ".."
import qs.config
import qs.utils
import Quickshell
import QtQuick

Searcher {
    id: root

    function transformSearch(search: string): string {
        return search.slice(`${Config.launcher.actionPrefix}install `.length);
    }

    list: [
        Option {
            option: "pacman"
            icon: "package_2"
            name: qsTr("Pacman")
            description: qsTr("Install from the Arch Linux official repositories.")
        },
        Option {
            option: "aur"
            icon: "public"
            name: qsTr("AUR")
            description: qsTr("Install from the Arch User Repository (AUR).")
        },
        Option {
            option: "remove"
            icon: "delete_forever"
            name: qsTr("Remove")
            description: qsTr("Uninstall a package")
        }
    ]
    useFuzzy: Config.launcher.useFuzzy.variants

    component Option: QtObject {
        required property string option
        required property string icon
        required property string name
        required property string description

        function onClicked(list: AppList): void {
            list.visibilities.launcher = false;
            Quickshell.execDetached(["kitty", "--class=dani-config-internal-float", "-e", "open-update-menu", option]);
        }
    }
}
