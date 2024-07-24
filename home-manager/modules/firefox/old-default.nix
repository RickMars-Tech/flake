{ config, pkgs, lib, inputs, ... }: {

  programs.firefox = {                  
    enable = true;
    profiles.rick = {
        isDefault = true;
        # Install extensions from NUR
         /* extensions = with pkgs.nur.repos.rycee.firefox-addons; [
            decentraleyes
            ublock-origin
            clearurls
            sponsorblock
            darkreader
            enhanced-h264ify
            df-youtube
            youtube-nonstop
            bitwarden
            auto-tab-discard
            youtube-recommended-videos
            return-youtube-dislikes
            facebook-container
            multi-account-containers
        ]; */
        settings = {

            # Disable about:config warning
            "browser.aboutConfig.showWarning" = "false";

            # Disable auto-update
            "app.update.channel" = "default";
            "app.update.service.enabled" = false;
            "app.update.download.promptMaxAttempts" = 0;
            "app.update.elevation.promptMaxAttempts" = 0;
            "browser.shell.checkDefaultBrowser" = false;
            "extensions.autoDisableScopes" = 0;

            # Privacy and History
            "app.shield.optoutstudies.enabled" = false;
            "app.normandy.enabled" = false;
            "app.normandy.api_url" = "";
            "browser.history_expire_days" = 21;
            "privacy.clearOnShutdown.history" = false;
            "privacy.trackingprotection.fingerprinting.enable" = true;
            "privacy.trackingprotection.cryptomining.enable" = true;
            "privacy.trackingprotection.enable" = true;
            "privacy.history.custom" = true;
            "privacy.userContext.ui.enabled" = true;
            "security.dialog_enable_delay" = false;
            "security.OCSP.enabled" = 0;
            "security.mixed_content.block_display_content"= true;
            "security.mixed_content.upgrade_display_content" = true;
            "security.mixed_content.upgrade_display_content.image" = true;
            "permissions.default.desktop-notification" = 2;
            "permissions.default.geo" = 2;

            # Fingerprinting
            "privacy.resistFingerprinting" = true;
            "privacy.resistFingerprinting.block_mozAddonManager" = true;
            "browser.startup.blankWindow" = false;

            # Disable crash reports
            "breakpad.reportURL" = "";
            "browser.tabs.crashReporting.sendReport" = false;

            # Captive Portal Detection / Network Checks
            "captivedetect.canonicalURL" = "";
            "network.captive-portal-service.enabled" = false;
            "network.connectivity-service.enabled" = false;

            # Safe Browsing
            "browser.safebrowsing.malware.enabled" = false;
            "browser.safebrowsing.phishing.enabled" = false;
            "browser.safebrowsing.blockedURIs.enabled" = false;
            "browser.safebrowsing.provider.google4.gethashURL" = "";
            "browser.safebrowsing.provider.google4.updateURL" = "";
            "browser.safebrowsing.provider.google.gethashURL" = "";
            "browser.safebrowsing.provider.google.updateURL" = "";
            "browser.safebrowsing.provider.google4.dataSharingURL" = "";
            "browser.safebrowsing.downloads.enabled" = false;
            "browser.safebrowsing.downloads.remote.enabled" = false;
            "browser.safebrowsing.downloads.remote.url" = "";
            "browser.safebrowsing.downloads.remote.block_potentially_unwanted" = false;
            "browser.safebrowsing.downloads.remote.block_uncommon" = false;
            "browser.safebrowsing.allowOverride" = false;

            # Anti-Tracking
            "browser.send_pings" = false;
            "browser.pocket.enabled" = false;

            # Search Bar: Suggestions, Autofill
            "browser.urlbar.suggest.quicksuggest.sponsored" = false;
            "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
            "browser.search.suggest.enabled" = false;
            "browser.urlbar.suggest.searches" = false;
            "browser.urlbar.trending.featureGate" = false;
            "browser.urlbar.addons.featureGate" = false;
            "browser.urlbar.mdn.featureGate" = false;
            "browser.urlbar.pocket.featureGate" = false;
            "browser.urlbar.weather.featureGate" = false;
            "browser.fixup.alternate.enabled" = false;
            "browser.urlbar.trimURLs" = false;
            "browser.urlbar.speculativeConnect.enabled" = false;
            "browser.formfill.enable" = false;
            "extensions.formautofill.addresses.enabled" = false;
            "extensions.formautofill.available" = "off";
            "extensions.formautofill.creditCards.enabled" = false;
            "browser.search.separatePrivateDefault.ui.enabled" = true;
            "browser.urlbar.update2.engineAliasRefresh" = true;

            # Downloads and Notifications
            "browser.download.animateNotifications" = false;
            "browser.download.always_ask_before_handling_new_types" = true;
            "browser.download.manager.addToRecentDocs" = false;
            "browser.download.open_pdf_attachments_inline" = true;
            "browser.download.useDownloadDir" = false;
            "content.notify.interval" = 100000;

            # Navigation and Tabs
            "browser.sessionstore.interval" = 60000;
            "browser.newtabpage.activity-stream.feeds.telemetry" = false;
            "browser.newtabpage.activity-stream.telemetry" = false;
            "browser.newtabpage.activity-stream.feeds.topsites" = false;
            "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
            "browser.bookmarks.openInTabClosesMenu" = false;
            "browser.menu.showViewImageInfo" = true;

            # Network: DNS, Proxy, IPv6
            "browser.places.speculativeConnect.enabled" = "false";
            "network.file.disable_unc_paths" = "true";
            "permissions.manager.defaultsUrl" = "";
            "network.cookie.cookiehardware-video-decoding,enabled" = true;
            "network.IDN_show_punycode" = true;
            "network.prefetch-next" = false;
            "network.predictor.enabled" = false;
            "network.cookie.sameSite.noneRequiresSecure" = true;
            "network.http.max-connections" = 1800;
            "network.http.max-persistent-connections-per-server" = 10;
            "network.http.max-urgent-start-excessive-connections-per-host" = 5;
            "network.http.pacing.requests.enabled" = false;
            "network.http.speculative-parallel-limit" = 0;
            "network.dns.disablePrefetch" = true;
            "network.dnsCacheExpiration" = 3600;
            "network.dns.max_high_priority_threads" = 8;
            "network.dns.disableIPv6" = "true";
            "network.ssl_tokens_cache_capacity" = 10240;
            "network.gio.supported-protocols" = "";

            # Audio/Video: WebRTC, WebGL
            "image.mem.decode_bytes_at_a_time" = 32768;
            "media.cache_readahead_limit" = 7200;
            "media.cache_resume_threshold" = 3600;
            "media.navigator.enabled" = false;
            "media.peerconnection.enabled" = false;
            "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
            "media.peerconnection.ice.default_address_only" = true;
            "media.peerconnection.ice.no_host" = true;
            "media.ffmpeg.vaapi.enable" = true;
            "gfx.canvas.accelerated.cache-items" = 4096;
            "gfx.canvas.accelerated.cache-size" = 512;
            "gfx.content.skia-font-cache-size" = 20;
            "gfx.webrender.all" = true;
            "webgl.disabled" = false;

            # Mouse settings
            "general.autoScroll" = true;
            "general.smoothScroll" = true;
            "mousewheel.min_line_scroll_amount" = 60;

            # Security
            "security.ssl.treat_unsafe_negotiation_as_broken" = true;
            "security.insecure_connection_text.enabled" = true;
            "security.insecure_connection_text.pbmode.enabled" = true;

            # Passwords
            "signon.autofillForms" = false;
            "signon.rememberSignons" = false;
            "signon.formlessCapture.enabled" = false;
            "network.auth.subresource-http-auth-allow" = 1;
            "signon.management.page.breach-alerts.enabled" = false;

            # Enable DRM content
            "media.eme.enabled" = true;
            "browser.eme.ui.enabled" = true;

            # Telemetry
            "beacon.enabled" = "false";
            "browser.ping-centre.telemetry" = "false";
            "datareporting.policy.dataSubmissionEnabled" = false;
            "datareporting.healthreport.uploadEnabled" = false;
            "toolkit.telemetry.archive.enabled" = false;
            "toolkit.telemetry.bhrPing.enabled" = false;
            "toolkit.telemetry.enabled" = false;
            "toolkit.telemetry.server" = "data:,";
            "toolkit.telemetry.coverage.opt-out" = true;
            "toolkit.telemetry.firstShutdownPing.enabled" = false;
            "toolkit.telemetry.hybridContent.enabled" = false;
            "toolkit.telemetry.newProfilePing.enabled" = false;
            "toolkit.telemetry.reportingpolicy.firstRun" = false;
            "toolkit.telemetry.shutdownPingSender.enabled" = false;
            "toolkit.telemetry.unified" = false;
            "toolkit.telemetry.updatePing.enabled" = false;
            "toolkit.coverage.opt-out" = true;
            "toolkit.coverage.endpoint.base" = "";

            # Interface and Behavior
            "browser.uitour.enabled" = false;
            "extensions.pocket.enabled" = false;
            "findbar.highlightAll" = true;
            "loop.enabled" = false;

            # UI Features
            "dom.disable_open_during_load" = true;
            "dom.popup_allowed_events" = "click dblclick mousedown pointerdown";

            # Disable Browse With Caret
            "accessibility.browsewithcaret" = false;
            "accessibility.browsewithcaret_shortcut.enabled" = false;
            "accessibility.warn_on_browsewithcaret" = false;
            "services.sync.prefs.sync-seen.accessibility.browsewithcaret" = false;
            "services.sync.prefs.sync.accessibility.browsewithcaret" = false;
            "services.sync.prefs.sync-seen.services.sync.prefs.sync.accessibility.browsewithcaret" = false;

            # Advanced DOM and Events Configuration
            "dom.enable_web_task_scheduling" = true;
            "dom.event.clipboardevents.enabled" = false;
            "dom.security.https_first" = true;
            "dom.security.https_first_schemeless" = true;
            "dom.security.sanitizer.enabled" = true;
            "fission.autostart" = true;
            "full-screen-api.transition-duration.enter" = "0 0";
            "full-screen-api.transition-duration.leave" = "0 0";
            "full-screen-api.warning.delay" = -1;
            "full-screen-api.warning.timeout" = 0;
            "reader.parse-on-load.enabled" = false;
            "reader.parse-on-load.force-enabled" = false; 
            "layout.css.grid-template-masonry-value.enabled" = true;
            "layout.css.has-selector.enabled" = true;
            "layout.word_select.eat_space_to_next_word" = false;

            # Cookies and Banners
            "browser.contentblocking.category" = "strict";
            "cookiebanners.service.mode" = 1;
            "cookiebanners.service.mode.privateBrowsing" = 1;

            # Disk Cache / Memory
            "browser.cache.disk.enable" = false;
            "browser.privatebrowsing.forceMediaMemoryCache" = true;
            "media.memory_cache_max_size" = 65536;
            "browser.sessionstore.privacy_level" = 2;
            "browser.sessionstore.resume_from_crash" = false;
            "toolkit.winRegisterApplicationRestart" = false;
            "browser.pagethumbnails.capturing_disabled" = true;
            "browser.shell.shortcutFavicons" = false;
            "browser.download.start_downloads_in_tmp_dir" = true;
            "browser.helperApps.deleteTempFileOnExit" = true;
            "browser.cache.jsbc_compression_level" = 3;

            # HTTPS (SSL/TLS, OSC, CERTS)
            "dom.security.https_only_mode" = true;
            "dom.security.https_only_mode_send_http_background_request" = false;
            "browser.xul.error_pages.expert_bad_cert" = true;
            "security.tls.enable_0rtt_data" = false;
            "security.OCSP.require" = true;
            "security.cert_pinning.enforcement_level" = 2;
            "security.remote_settings.crlite_filters.enabled" = true;
            "security.pki.crlite_mode" = 2;

            # Headers / Referers
            "network.http.referer.XOriginPolicy" = 2;
            "network.http.referer.XOriginTrimmingPolicy" = 2;

            # Geo-Location
            "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";

            # Disable using the OS’s geolocation service
            "geo.provider.use_gpsd" = "false";
            "geo.provider.use_geoclue" = "false";

            # Disable region updates
            "browser.region.network.url" = "";
            "browser.region.update.enabled" = "false";

            # Language / Locale
            "intl.accept_languages" = "es-MS, es";

            # Auto-updates / Recommendations
            "app.update.auto" = "false";
            "extensions.getAddons.showPane" = "false";
            "extensions.htmlaboutaddons.recommendations.enabled" = "false";
            "browser.discovery.enabled" = "false";

            # URL Config
            "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
            "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
            "webchannel.allowObject.urlWhitelist" = "";

            # PDF and Reader
            "pdfjs.enableScripting" = false;

            # Extensions
            "extensions.enabledScopes" = 5;
            "extensions.webextensions.restrictedDomains" = "";
            "extensions.postDownloadThirdPartyPrompt" = false;

            # XDG-Portal
            "widget.use-xdg-desktop-portal.file-picker" = 1;
            "widget.use-xdg-desktop-portal.mime-handler" = 1;

        };
        # userChome.css to make it look better
        userChrome = "
                    * { 
                        box-shadow: none !important;
                        border: 0px solid !important;
                    }

                    #tabbrowser-tabs {
                        --user-tab-rounding: 8px;
                    }

                    .tab-background {
                        border-radius: var(--user-tab-rounding) var(--user-tab-rounding) 0px 0px !important; /* Connected */
                        margin-block: 1px 0 !important; /* Connected */
                    }
                    #scrollbutton-up, #scrollbutton-down { /* 6/10/2021 */
                        border-top-width: 1px !important;
                        border-bottom-width: 0 !important;
                    }

                    .tab-background:is([selected], [multiselected]):-moz-lwtheme {
                        --lwt-tabs-border-color: rgba(0, 0, 0, 0.5) !important;
                        border-bottom-color: transparent !important;
                    }
                    [brighttext='true'] .tab-background:is([selected], [multiselected]):-moz-lwtheme {
                        --lwt-tabs-border-color: rgba(255, 255, 255, 0.5) !important;
                        border-bottom-color: transparent !important;
                    }

                    /* Container color bar visibility */
                    .tabbrowser-tab[usercontextid] > .tab-stack > .tab-background > .tab-context-line {
                        margin: 0px max(calc(var(--user-tab-rounding) - 3px), 0px) !important;
                    }

                    #TabsToolbar, #tabbrowser-tabs {
                        --tab-min-height: 29px !important;
                    }
                    #main-window[sizemode='true'] #toolbar-menubar[autohide='true'] + #TabsToolbar, 
                    #main-window[sizemode='true'] #toolbar-menubar[autohide='true'] + #TabsToolbar #tabbrowser-tabs {
                        --tab-min-height: 30px !important;
                    }
                    #scrollbutton-up,
                    #scrollbutton-down {
                        border-top-width: 0 !important;
                        border-bottom-width: 0 !important;
                    }

                    #TabsToolbar, #TabsToolbar > hbox, #TabsToolbar-customization-target, #tabbrowser-arrowscrollbox  {
                        max-height: calc(var(--tab-min-height) + 1px) !important;
                    }
                    #TabsToolbar-customization-target toolbarbutton > .toolbarbutton-icon, 
                    #TabsToolbar-customization-target .toolbarbutton-text, 
                    #TabsToolbar-customization-target .toolbarbutton-badge-stack,
                    #scrollbutton-up,#scrollbutton-down {
                        padding-top: 7px !important;
                        padding-bottom: 6px !important;
                    }
        ";
    };
    package = (pkgs.wrapFirefox (pkgs.firefox-unwrapped.override { pipewireSupport = true;}) {});
  };
}
