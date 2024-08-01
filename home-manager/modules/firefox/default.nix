{ config, pkgs, lib, inputs, ... }: {

    imports = [
        ./chrome.nix
        ./content.nix
    ];

    programs.firefox = {                  
        enable = true;
        policies = {
            DisableFirefoxStudies = true;
            EnableTrackingProtection = {
                Value = true;
                Locked = true;
                Cryptomining = true;
                Fingerprinting = true;
            };
            PasswordManagerEnabled = false;
            OfferToSaveLoginsDefault = false;
            NoDefaultBookmarks = true;
            DisableFirefoxScreenshots = true;
        };
        profiles.rick = {
            isDefault = true;
            settings = {
            # Firefox Hardening File, from:
            # https://github.com/pyllyukko/user.js/blob/master/user.js

            # Disable about:config warning
                "browser.aboutConfig.showWarning" = "false";

            # SECTION: Misc
                "network.cookie.cookieBehavior" = 1;
                "camera.control.face_detection.enabled" = false;
                "browser.search.countryCode" = "MX";
                "browser.search.region" = "MX";
                "browser.search.geoip.url" = "";
                "intl.accept_languages" = "es-MX, es";
                "intl.locale.matchOS" = false;
                "browser.search.geoSpecificDefaults" = false;
                "clipboard.autocopy" = true;
                "javascript.use_us_english_locale" = true;
                "keyword.enabled" = true;
                "browser.urlbar.trimURLs" = false;
                "browser.urlbar.speculativeConnect.enabled" = false;
                "browser.fixup.alternate.enabled" = false;
                "browser.fixup.hide_user_pass" = true;
                "network.proxy.socks_remote_dns" = true;
                "network.manage-offline-status" = false;
                "security.mixed_content.block_active_content" = true;
                "security.mixed_content.block_display_content" = true;
                "network.jar.open-unsafe-types" = false;
                "security.xpconnect.plugin.unrestricted" = false;
                "security.fileuri.strict_origin_policy" = true;
                "browser.urlbar.filter.javascript" = true;
                "javascript.options.asmjs" = false;
                "media.video_stats.enabled" = false;
                "general.buildID.override" = "20100101";
                "browser.startup.homepage_override.buildID" = "20100101";
                "browser.display.use_document_fonts" = 0;
                "network.protocol-handler.warn-external-default" = true;
                "network.protocol-handler.external.http" = false;
                "network.protocol-handler.external.https" = false;
                "network.protocol-handler.external.javascript" = false;
                "network.protocol-handler.external.moz-extension" = false;
                "network.protocol-handler.external.ftp" = false;
                "network.protocol-handler.external.file" = false;
                "network.protocol-handler.external.about" = false;
                "network.protocol-handler.external.chrome" = false;
                "network.protocol-handler.external.blob" = false;
                "network.protocol-handler.external.data" = false;
                "network.protocol-handler.expose-all" = false;
                "network.protocol-handler.expose.http" = true;
                "network.protocol-handler.expose.https" = true;
                "network.protocol-handler.expose.javascript" = true;
                "network.protocol-handler.expose.moz-extension" = true;
                "network.protocol-handler.expose.ftp" = true;
                "network.protocol-handler.expose.file" = true;
                "network.protocol-handler.expose.about" = true;
                "network.protocol-handler.expose.chrome" = true;
                "network.protocol-handler.expose.blob" = true;
                "network.protocol-handler.expose.data" = true;

            # SECTION: HTML5 / APIs / DOM
                "dom.webnotifications.enabled" = false;
                "dom.enable_performance" = false;
                "dom.enable_user_timing" = false;
                "dom.webaudio.enabled" = false;
                "geo.enabled" = false;
                "geo.wifi.uri" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
                "geo.wifi.logging.enabled" = false;
                "dom.mozTCPSocket.enabled" = false;
                "dom.netinfo.enabled" = false;
                "dom.network.enabled" = false;
                "media.peerconnection.ice.no_host" = true;
                "media.navigator.enabled" = false;
                "media.navigator.video.enabled" = false;
                "media.getusermedia.screensharing.enabled" = false;
                "media.getusermedia.audiocapture.enabled" = false;
                "dom.telephony.enabled" = false;
                "beacon.enabled" = false;
                "dom.event.clipboardevents.enabled" = false;
                "dom.allow_cut_copy" = false;
                "media.webspeech.recognition.enable" = false;
                "media.webspeech.synth.enabled" = false;
                "device.sensors.enabled" = false;
                "browser.send_pings" = false;
                "browser.send_pings.require_same_host" = true;
                "dom.gamepad.enabled" = false;
                "dom.vr.enabled" = false;
                "dom.vibrator.enabled" = false;
                "dom.maxHardwareConcurrency" = 2;
                "javascript.options.wasm" = false;

            # SECTION: Extensions / plugins
                "security.dialog_enable_delay" = 1000;
                "extensions.getAddons.cache.enabled" = false;
                "lightweightThemes.update.enabled" = false;
                "plugin.state.flash" = 0;
                "plugin.state.java" = 0;
                "dom.ipc.plugins.flash.subprocess.crashreporter.enabled" = false;
                "dom.ipc.plugins.reportCrashURL" = false;
                "browser.safebrowsing.blockedURIs.enabled" = true;
                "plugin.state.libgnome-shell-browser-plugin" = 0;
                "plugins.click_to_play" = true;
                "extensions.update.enabled" = true;
                "extensions.blocklist.enabled" = true;
                "services.blocklist.update_enabled" = true;
                "extensions.blocklist.url" = "https://blocklist.addons.mozilla.org/blocklist/3/%APP_ID%/%APP_VERSION%/";
                "extensions.systemAddon.update.enabled" = false;

            # SECTION: Firefox (anti-)features / components / Firefox Telemetry
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr" = false;
                "devtools.webide.enabled" = false;
                "devtools.webide.autoinstallADBHelper" = false;
                "devtools.webide.autoinstallFxdtAdapters" = false;
                "devtools.debugger.remote-enabled" = true;
                "devtools.chrome.enabled" = false;
                "devtools.debugger.force-local" = true;
                "toolkit.telemetry.enabled" = false;
                "toolkit.telemetry.unified" = false;
                "toolkit.telemetry.archive.enabled" = false;
                "experiments.supported" = false;
                "experiments.enabled" = false;
                "experiments.manifest.uri" = "";
                "network.allow-experiments" = false;
                "breakpad.reportURL" = "";
                "browser.tabs.crashReporting.sendReport" = false;
                "browser.crashReports.unsubmittedCheck.enabled" = false;
                "dom.flyweb.enabled" = false;
                "browser.uitour.enabled" = false;
                "browser.sessionstore.privacy_level" = 2;
                "privacy.trackingprotection.enabled" = true;
                "privacy.trackingprotection.pbmode.enabled" = true;
                "privacy.trackingprotection.fingerprinting.enabled" = true;
                "privacy.trackingprotection.cryptomining.enabled" = true;
                "privacy.userContext.enabled" = true;
                "privacy.resistFingerprinting" = true;
                "privacy.resistFingerprinting.block_mozAddonManager" = true;
                "extensions.webextensions.restrictedDomains" = "";
                "browser.startup.blankWindow" = false;
                "pdfjs.disabled" = true;
                "datareporting.healthreport.uploadEnabled" = false;
                "datareporting.healthreport.service.enabled" = false;
                "datareporting.policy.dataSubmissionEnabled" = false;
                "app.normandy.enabled" = false;
                "app.normandy.api_url" = "";
                "extensions.shield-recipe-client.enabled" = false;
                "app.shield.optoutstudies.enabled" = false;
                "loop.logDomains" = false;
                "app.update.enabled" = true;
                "browser.safebrowsing.phishing.enabled" = true;
                "browser.safebrowsing.malware.enabled" = true;
                "browser.safebrowsing.downloads.remote.enabled" = false;
                "browser.pocket.enabled" = false;
                "extensions.pocket.enabled" = false;
                "privacy.globalprivacycontrol.enabled" = true;

            # SECTION: Automatic connections
                "network.dns.blockDotOnion" = true;
                "browser.search.suggest.enabled" = false;
                "browser.urlbar.suggest.searches" = false;
                "browser.urlbar.suggest.history" = false;
                "browser.urlbar.groupLabels.enabled" = false;
                "browser.casting.enabled" = false;
                "media.gmp-gmpopenh264.enabled" = false;
                "media.gmp-manager.url" = "";
                "network.http.speculative-parallel-limit" = 0;
                "browser.aboutHomeSnippets.updateUrl" = "";
                "browser.search.update" = false;
                "network.captive-portal-service.enabled" = false;
                "browser.topsites.contile.enabled" = false;
                "browser.newtabpage.activity-stream.feeds.topsites" = false;

            # SECTION: HTTP
                "network.negotiate-auth.allow-insecure-ntlm-v1" = false;
                "security.csp.experimentalEnabled" = false;
                "security.csp.enable" = true;
                "security.sri.enable" = true;
                "network.http.referer.XOriginPolicy" = 2;
                "network.http.referer.trimmingPolicy" = 2;
                "network.http.referer.XOriginTrimmingPolicy" = 2;
                "privacy.firstparty.isolate" = true;

            # SECTION: Geolocation
                "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";
                "geo.provider.use_gpsd" = false;
                "geo.provider.use_geoclue" = false;

            # SECTION: UI related
                "browser.compactmode.show" = true;
                "ui.key.menuAccessKeyFocuses" = false;
                "security.insecure_password.ui.enabled" = true;
                "browser.download.folderList" = 2;
                "browser.download.useDownloadDir" = false;
                "browser.newtabpage.enabled" = false;
                "browser.newtab.url" = "about:blank";
                "browser.newtabpage.activity-stream.feeds.snippets" = false;
                "browser.newtabpage.activity-stream.feeds.telemetry" = false;
                "browser.newtabpage.activity-stream.telemetry" = false;
                "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
                "browser.newtabpage.activity-stream.section.highlights.includePocket" = false;
                "browser.newtabpage.activity-stream.feeds.discoverystreamfeed" = false;
                "browser.newtabpage.activity-stream.showSponsored" = false;
                "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
                "browser.newtabpage.activity-stream.default.sites" = "";
                "browser.newtabpage.activity-stream.enabled" = false;
                "browser.newtabpage.enhanced" = false;
                "browser.newtab.preload" = false;
                "browser.newtabpage.directory.ping" = "";
                "browser.newtabpage.directory.source" = "data:text/plain,{}";
                "browser.vpn_promo.enabled" = false;
                "network.IDN_show_punycode" = true;
                "browser.urlbar.autoFill" = false;
                "browser.urlbar.autoFill.typed" = false;
                "layout.css.visited_links_enabled" = false;
                "browser.urlbar.autocomplete.enabled" = false;
                "security.ask_for_password" = 2;
                "security.password_lifetime" = 1;
                "browser.offline-apps.notify" = true;
                "browser.privatebrowsing.vpnpromourl" = "";
                "extensions.getAddons.showPane" = false;
                "extensions.htmlaboutaddons.recommendations.enabled" = false;
                "browser.discovery.enabled" = false;
                "browser.shell.checkDefaultBrowser" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons" = false;
                "browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features" = false;
                "browser.preferences.moreFromMozilla" = false;
                "browser.aboutwelcome.enabled" = false;
                "browser.tabs.tabmanager.enabled" = false;
                "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
                "layout.css.prefers-color-scheme.content-override" = 0;
                "browser.theme.dark-private-windows" = true;
                "cookiebanners.service.mode" = 0;
                "cookiebanners.service.mode.privateBrowsing" = 0;
                "browser.urlbar.suggest.engines" = false;

            # SECTION: Cryptography
                "dom.security.https_only_mode" = true;
                "network.stricttransportsecurity.preloadlist" = true;
                "security.OCSP.enabled" = 1;
                "security.ssl.enable_ocsp_stapling" = true;
                "security.ssl.enable_ocsp_must_staple" = true;
                "security.OCSP.require" = true;
                "security.ssl.disable_session_identifiers" = true;
                "security.tls.version.min" = 3;
                "security.tls.version.max" = 4;
                "security.tls.version.fallback-limit" = 4;
                "security.cert_pinning.enforcement_level" = 2;
                "security.pki.sha1_enforcement_level" = 1;
                "security.ssl.treat_unsafe_negotiation_as_broken" = true;
                "security.ssl.errorReporting.automatic" = false;
                "browser.ssl_override_behavior" = 1;
                "network.security.esni.enabled" = true;

            # SECTION: Cipher suites
                "security.ssl3.rsa_null_sha" = false;
                "security.ssl3.rsa_null_md5" = false;
                "security.ssl3.ecdhe_rsa_null_sha" = false;
                "security.ssl3.ecdhe_ecdsa_null_sha" = false;
                "security.ssl3.ecdh_rsa_null_sha" = false;
                "security.ssl3.ecdh_ecdsa_null_sha" = false;
                "security.ssl3.rsa_seed_sha" = false;
                "security.ssl3.rsa_rc4_40_md5" = false;
                "security.ssl3.rsa_rc2_40_md5" = false;
                "security.ssl3.rsa_1024_rc4_56_sha" = false;
                "security.ssl3.rsa_camellia_128_sha" = false;
                "security.ssl3.ecdhe_rsa_aes_128_sha" = false;
                "security.ssl3.ecdhe_ecdsa_aes_128_sha" = false;
                "security.ssl3.ecdh_rsa_aes_128_sha" = false;
                "security.ssl3.ecdh_ecdsa_aes_128_sha" = false;
                "security.ssl3.dhe_rsa_camellia_128_sha" = false;
                "security.ssl3.dhe_rsa_aes_128_sha" = false;
                "security.ssl3.ecdh_ecdsa_rc4_128_sha" = false;
                "security.ssl3.ecdh_rsa_rc4_128_sha" = false;
                "security.ssl3.ecdhe_ecdsa_rc4_128_sha" = false;
                "security.ssl3.ecdhe_rsa_rc4_128_sha" = false;
                "security.ssl3.rsa_rc4_128_md5" = false;
                "security.ssl3.rsa_rc4_128_sha" = false;
                "security.tls.unrestricted_rc4_fallback" = false;
                "security.ssl3.dhe_dss_des_ede3_sha" = false;
                "security.ssl3.dhe_rsa_des_ede3_sha" = false;
                "security.ssl3.ecdh_ecdsa_des_ede3_sha" = false;
                "security.ssl3.ecdh_rsa_des_ede3_sha" = false;
                "security.ssl3.ecdhe_ecdsa_des_ede3_sha" = false;
                "security.ssl3.ecdhe_rsa_des_ede3_sha" = false;
                "security.ssl3.rsa_des_ede3_sha" = false;
                "security.ssl3.rsa_fips_des_ede3_sha" = false;
                "security.ssl3.ecdh_rsa_aes_256_sha" = false;
                "security.ssl3.ecdh_ecdsa_aes_256_sha" = false;
                "security.ssl3.rsa_camellia_256_sha" = false;
                "security.ssl3.ecdhe_ecdsa_aes_128_gcm_sha256" = true;
                "security.ssl3.ecdhe_rsa_aes_128_gcm_sha256" = true;
                "security.ssl3.ecdhe_ecdsa_chacha20_poly1305_sha256" = true;
                "security.ssl3.ecdhe_rsa_chacha20_poly1305_sha256" = true;
                "security.ssl3.dhe_rsa_camellia_256_sha" = false;
                "security.ssl3.dhe_rsa_aes_256_sha" = false;
                "security.ssl3.dhe_dss_aes_128_sha" = false;
                "security.ssl3.dhe_dss_aes_256_sha" = false;
                "security.ssl3.dhe_dss_camellia_128_sha" = false;
                "security.ssl3.dhe_dss_camellia_256_sha" = false;
                "security.tls.enable_kyber" = true;

            # Speed / Smooth Scrolling
                "content.notify.interval" = 100000;
                "browser.cache.jsbc_compression_level" = 3;
                "media.memory_cache_max_size" = 65536;
                "media.cache_readahead_limit" = 7200;
                "media.cache_resume_threshold" = 3600;
                "image.mem.decode_bytes_at_a_time" = 32768;
                "network.http.max-connections" = 1800;
                "network.http.max-persistent-connections-per-server" = 10;
                "network.http.max-urgent-start-excessive-connections-per-host" = 5;
                "network.http.pacing.requests.enabled" = false;
                "network.dnsCacheExpiration" = 3600;
                "network.ssl_tokens_cache_capacity" = 10240;
                "network.dns.disablePrefetch" = true;
                "network.dns.disablePrefetchFromHTTPS" = true;
                "network.prefetch-next" = false;
                "network.predictor.enabled" = false;
                "layout.css.grid-template-masonry-value.enabled" = true;
                "dom.enable_web_task_scheduling" = true;
                "dom.security.sanitizer.enabled" = true;
                "apz.overscroll.enabled" = true;
                "general.smoothScroll" = true;
                "mousewheel.min_line_scroll_amount" = 10;
                "general.smoothScroll.mouseWheel.durationMinMS" = 80;
                "general.smoothScroll.currentVelocityWeighting" = "0.15";
                "general.smoothScroll.stopDecelerationWeighting" = "0.6";

            # GFX / WebGL
                "gfx.canvas.accelerated.cache-items" = 4096;
                "gfx.canvas.accelerated.cache-size" = 512;
                "gfx.content.skia-font-cache-size" = 20;
                "gfx.font_rendering.opentype_svg.enabled" = false;
                "webgl.disabled" = true;
                "webgl.min_capability_mode" = true;
                "webgl.disable-extensions" = true;
                "webgl.disable-fail-if-major-performance-caveat" = true;
                "webgl.enable-debug-renderer-info" = false;

            # XDG-Portal
                "widget.use-xdg-desktop-portal.file-picker" = 1;
                "widget.use-xdg-desktop-portal.mime-handler" = 1;

            };
        };
        package = (pkgs.wrapFirefox (pkgs.firefox-beta-unwrapped.override { pipewireSupport = true;}) {});
    };
}
