{ config, pkgs, ... }:{

  home-manager.users.alexa = {  
    programs.firefox = {
      enable = true;

      profiles = {
        personal = {
          id = 0;
          name = "default";
          isDefault = true;
          settings = let
            newTab = let
              activityStream = "browser.newtabpage.activity-stream";
            in {
              "${activityStream}.feeds.topsites" = true;
              "${activityStream}.feeds.section.highlights" = true;
              "${activityStream}.feeds.section.topstories" = false;
              "${activityStream}.feeds.section.highlights.includePocket" = false;
              "${activityStream}.section.highlights.includePocket" = false;
              "${activityStream}.showSearch" = true;
              "${activityStream}.showSponsoredTopSites" = false;
              "${activityStream}.showSponsorsed" = false;
            };

            searchBar = {
              "browser.urlbar.suggest.quicksuggest.sponsored" = false;
              "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
            };

            telemetry = {
              "browser.newtabpage.activity-stream.telemetry" = false;
              "browser.newtabpage.activity-stream.feeds.telemetry" = false;
              "browser.ping-centre.telemetry" = false;
              "toolkit.telemetry.reportingpolicy.firstRun" = false;
              "toolkit.telemetry.unified" = false;
              "toolkit.telemetry.archive.enabled" = false;
              "toolkit.telemetry.updatePing.enabled" = false;
              "toolkit.telemetry.shutdownPingSender.enabled" = false;
              "toolkit.telemetry.newProfilePing.enabled" = false;
              "toolkit.telemetry.bhrPing.enabled" = false;
              "toolkit.telemetry.firstShutdownPing.enabled" = false;
              "datareporting.healthreport.uploadEnabled" = false;
              "datareporting.policy.dataSubmissionEnabled" = false;
              "app.shield.optoutstudies.enable" = false;
            };

            https = {
              "dom.security.https_only_mode" = true;
              "dom.security.https_only_mode_ever_enabled" = true;
            };

            graphics = {
              "media.ffmpeg.vaapi.enabled" = true;
              "media.rdd-ffmpeg.enabled" = true;
              "media.navigator.medidataencoder_vpx_enabled" = true;
            };

            general_settings = {
              "browser.aboutConfig.showWarning" = false;
              "browser.shell.checkDefaultBrowser" = false;
              "browser.urlbar.showSearchSuggestionsFirst" = false;
              "extensions.htmlaboutaddons.inline-options.enabled" = false;
              "extensions.htmlaboutaddons.recommendations.enabled" = false;
              "extensions.pocket.enabled" = false;
              "browser.fullscreen.autohide" = false;
            };

            passwords = {
              "signon.rememberSignons" = false;
              "signon.autofillForms" = false;
              "signon.generation.enabled" = false;
              "signon.management.page.breach-alerts.enabled" = false;
            };

            downloads = {
              "browser.download.useDownloadDir" = true;
            };
          in
            general_settings // https // newTab // searchBar // telemetry // graphics // downloads;
        };
      };
    };
  };
}
