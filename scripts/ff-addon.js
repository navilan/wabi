async function set_addons_as_active() {

    Components.utils.import("resource://gre/modules/addons/XPIDatabase.jsm");
    Components.utils.import("resource://gre/modules/AddonManager.jsm");
    let addons = await XPIDatabase.getAddonList(a => true);

    for (let addon of addons) {
        // The add-on might have vanished, we'll catch that on the next startup
        if (!addon._sourceBundle || !addon._sourceBundle.exists())
            continue;
        // if (addon.active) continue;
        if (addon.defaultLocale.name === "WebCompat Reporter") continue;

        if( addon.signedState != AddonManager.SIGNEDSTATE_UNKNOWN ) continue;
        addon.signedState = AddonManager.SIGNEDSTATE_NOT_REQUIRED;
        AddonManagerPrivate.callAddonListeners("onPropertyChanged",
                                                addon.wrapper,
                                                ["signedState"]);
    XPIDatabase.saveChanges();
}

set_addons_as_active();
