import Cookies from "js-cookie";

export class Consent {
  static cookieBaseName = "teachfe-cookie-preferences";
  static cookieVersion = 1;
  static cookieLifetimeInDays = 90;
  static cookieAcceptanceBannerId = "cookie-banner-accepted";
  static cookieRejectionBannerId = "cookie-banner-rejected";

  static get cookieName() {
    return Consent.cookieBaseName + "-v" + Consent.cookieVersion;
  }

  //Change to switch case in code re-write ACP
  //Could neaten the code up also by setting reject/accept/cookies banner as
  //...display:none in css rather than relying on if statement.

  init(id) {
    const v = Cookies.get(Consent.cookieName);
    if (v !== null && v !== undefined) {
      document.getElementById(id).style.display = "none";
      document.getElementById(Consent.cookieAcceptanceBannerId).style.display =
        "none";
      document.getElementById(Consent.cookieRejectionBannerId).style.display =
        "none";
      const granted = JSON.parse(v);

      let cookieAcceptRejectHeight = 0;

      if (granted.isGranted) {
        document.getElementById(
          Consent.cookieAcceptanceBannerId
        ).style.display = "block";
        cookieAcceptRejectHeight = document.getElementById(
          Consent.cookieAcceptanceBannerId
        ).offsetHeight;
        this.enableCookies();
      } else {
        document.getElementById(Consent.cookieRejectionBannerId).style.display =
          "block";
        cookieAcceptRejectHeight = document.getElementById(
          Consent.cookieRejectionBannerId
        ).offsetHeight;
        this.removeCookies();
      }

      if (granted.confirmationHidden) {
        document.getElementById(
          Consent.cookieAcceptanceBannerId
        ).style.display = "none";
        document.getElementById(Consent.cookieRejectionBannerId).style.display =
          "none";
      } else {
        this.saveConsentPreferences("cookie-banner", {
          isGranted: granted.isGranted,
          confirmationHidden: true,
        });
        document.getElementById("footer").style.marginBottom =
          cookieAcceptRejectHeight + "px";
      }
    } else {
      document.getElementById(id).style.display = "block";
      const cookieBannerHeight =
        document.getElementById("cookie-banner").offsetHeight;
      document.getElementById("footer").style.marginBottom =
        cookieBannerHeight + "px";
      document.getElementById(Consent.cookieAcceptanceBannerId).style.display =
        "none";
      document.getElementById(Consent.cookieRejectionBannerId).style.display =
        "none";
    }
  }

  enableCookies() {
    const v = Cookies.get(Consent.cookieName);
    if (v !== null && v !== undefined) {
      const granted = JSON.parse(v);
      if (granted.isGranted) {
        gtag("consent", "default", {
          ad_storage: "granted",
          analytics_storage: "granted",
        });
      }
    }
  }

  removeCookies() {
    gtag("consent", "update", {
      ad_storage: "denied",
      analytics_storage: "denied",
    });

    const cookies = Cookies.get();

    for (const cookie in cookies) {
      if (cookie !== Consent.cookieName) {
        Cookies.remove(cookie);
      }
    }
  }

  saveConsentPreferences(id, prefs) {
    const serialized = JSON.stringify(prefs);
    Cookies.set(Consent.cookieName, serialized, {
      expires: Consent.cookieLifetimeInDays,
      sameSite: "Lax",
    });

    document.getElementById(id).style.display = "none";
  }

  consentAccepted(id, showBannerOnNextPage = false) {
    document.getElementById(Consent.cookieAcceptanceBannerId).style.display =
      "block";
    const cookieBannerAcceptedHeight = document.getElementById(
      Consent.cookieAcceptanceBannerId
    ).offsetHeight;
    document.getElementById("footer").style.marginBottom =
      cookieBannerAcceptedHeight + "px";
    document.getElementById(Consent.cookieAcceptanceBannerId).focus();
    this.enableCookies();
    this.saveConsentPreferences(id, {
      isGranted: true,
      confirmationHidden: !showBannerOnNextPage,
    });
  }

  consentRejected(id, showBannerOnNextPage = false) {
    document.getElementById(Consent.cookieRejectionBannerId).style.display =
      "block";
    const cookieBannerRejectedHeight = document.getElementById(
      Consent.cookieRejectionBannerId
    ).offsetHeight;
    document.getElementById("footer").style.marginBottom =
      cookieBannerRejectedHeight + "px";
    document.getElementById(Consent.cookieRejectionBannerId).focus();
    this.removeCookies();
    this.saveConsentPreferences(id, {
      isGranted: false,
      confirmationHidden: !showBannerOnNextPage,
    });
  }

  hideCookieConfirmation(id) {
    document.getElementById(Consent.cookieAcceptanceBannerId).style.display =
      "none";
    document.getElementById(Consent.cookieRejectionBannerId).style.display =
      "none";
    document.getElementById("footer").style.marginBottom = "0px";
  }
}
