{ config, pkgs, lib, inputs, ... }:

{

  programs.firefox = {                  
    enable = true;
    profiles.rick = {
        isDefault = true;
        search.default = "DuckDuckGo";
        search.privateDefault = "DuckDuckGo";
        containers = {
            Usuario = {
                color = "blue";
                icon = "fingerprint";
                id = 0;
                name = "Usuario";
            };
            Privado = {
                color = "pink";
                icon = "briefcase";
                id = 1;
                name = "Privado";
            };
            Facebook = {
                color = "toolbar";
                icon = "fence";
                id = 3;
                name = "Facebook";
            };
        };
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
          "beacon.enabled" = false;
          "browser.history_expire_days" = 21;
          "browser.contentblocking.category" = "strict";
          "privacy.clearOnShutdown.history" = false;
          "privacy.trackingprotection.fingerprinting.enable" = true;
          "privacy.trackingprotection.cryptomining.enable" = true;
          "privacy.trackingprotection.enable" = true;
          "privacy.history.custom" = true;
          "privacy.userContext.ui.enabled" = true;
          "security.dialog_enable_delay" = false;
          "security.OCSP.enabled" = 0;
          "security.remote_settings.crlite_filters.enabled" = true;
          "security.pki.crlite_mode" = 2;
          "security.mixed_content.block_display_content"= true;
          "security.mixed_content.upgrade_display_content" = true;
          "security.mixed_content.upgrade_display_content.image" = true;
          "permissions.default.desktop-notification" = 2;
          "permissions.default.geo" = 2;
          "permissions.manager.defaultsUrl" = "";

          #  Anti-Tracking
          "browser.send_pings" = false;
          "browser.sessionstore.privacy_level" = 2;
          "browser.safebrowsing.downloads.remote.enabled" = false;
          "browser.pocket.enabled" = false;
          "browser.xul.error_pages.expert_bad_cert" = true;

          # Search and Address Bar
          "browser.search.separatePrivateDefault.ui.enabled" = true;
          "browser.urlbar.update2.engineAliasRefresh" = true;
          "browser.search.suggest.enabled" = false;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;

          # Downloads and Notifications
          "browser.download.start_downloads_in_tmp_dir" = true;
          "browser.helperApps.deleteTempFileOnExit" = true;
          "browser.download.animateNotifications" = false;
          "browser.download.always_ask_before_handling_new_types" = true;
          "browser.download.manager.addToRecentDocs" = false;
          "browser.download.open_pdf_attachments_inline" = true;

          # Navigation and Tabs
          "browser.sessionstore.interval" = 60000;
          "browser.newtabpage.activity-stream.feeds.telemetry" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.newtabpage.activity-stream.feeds.topsites" = false;
          "browser.newtabpage.activity-stream.feeds.section.topstories" = false;
          "browser.ping-centre.telemetry" = false;
          "browser.bookmarks.openInTabClosesMenu" = false;
          "browser.menu.showViewImageInfo" = true;

          # Network and DNS
          "network.cookie.cookiehardware-video-decoding,enabled" = true;
          "network.IDN_show_punycode" = true;
          "network.http.referer.XOriginTrimmingPolicy" = 2;
          "network.prefetch-next" = false;
          "network.predictor.enabled" = false;
          "network.cookie.sameSite.noneRequiresSecure" = true;
          "network.http.max-connections" = 1800;
          "network.http.max-persistent-connections-per-server" = 10;
          "network.http.max-urgent-start-excessive-connections-per-host" = 5;
          "network.http.pacing.requests.enabled" = false;
          "network.dns.disablePrefetch" = true;
          "network.dnsCacheExpiration" = 3600;
          "network.dns.max_high_priority_threads" = 8;
          "network.ssl_tokens_cache_capacity" = 10240;

          # Multimedia Settings
          "image.mem.decode_bytes_at_a_time" = 32768;
          "media.memory_cache_max_size" = 65536;
          "media.cache_readahead_limit" = 7200;
          "media.cache_resume_threshold" = 3600;
          "media.navigator.enabled" = false;
          "media.peerconnection.ice.proxy_only_if_behind_proxy" = true;
          "media.peerconnection.ice.default_address_only" = true;

          # Rendering and Graphics
          "gfx.canvas.accelerated.cache-items" = 4096;
          "gfx.canvas.accelerated.cache-size" = 512;
          "gfx.content.skia-font-cache-size" = 20;
          "gfx.webrender.all" = true;
          "webgl.disabled" = false;
          "media.ffmpeg.vaapi.enable" = true;

          # Mouse settings
          "general.autoScroll" = true;
          "general.smoothScroll" = true;
          "mousewheel.min_line_scroll_amount" = 60;

          # Security
          "security.ssl.treat_unsafe_negotiation_as_broken" = true;
          "security.tls.enable_0rtt_data" = false;
          "security.insecure_connection_text.enabled" = true;
          "security.insecure_connection_text.pbmode.enabled" = true;

          # Disable autofill & password
          "browser.formfill.enable" = false;
          "extensions.formautofill.addresses.enabled" = false;
          "extensions.formautofill.creditCards.enabled" = false;
          "signon.management.page.breach-alerts.enabled" = false;
          "signon.rememberSignons" = false;
          "signon.autofillForms" = false;

          # Enable DRM content
          "media.eme.enabled" = true;
          "browser.eme.ui.enabled" = true;

          # Telemetry
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
          "browser.privatebrowsing.forceMediaMemoryCache" = true;
          "browser.uitour.enabled" = false;
          "extensions.postDownloadThirdPartyPrompt" = false;
          "extensions.pocket.enabled" = false;
          "findbar.highlightAll" = true;
          "loop.enabled" = false;

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
          "cookiebanners.service.mode" = 1;
          "cookiebanners.service.mode.privateBrowsing" = 1;

          # Cache and Notificaciones
          "browser.cache.jsbc_compression_level" = 3;
          "content.notify.interval" = 100000;

          # Geo-Location
          "geo.provider.network.url" = "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%";

          # URL Config
          "urlclassifier.trackingSkipURLs" = "*.reddit.com, *.twitter.com, *.twimg.com, *.tiktok.com";
          "urlclassifier.features.socialtracking.skipURLs" = "*.instagram.com, *.twitter.com, *.twimg.com";
          "webchannel.allowObject.urlWhitelist" = "";

          # PDF and Reader
          "pdfjs.enableScripting" = false;

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
