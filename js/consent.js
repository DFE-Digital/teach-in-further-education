import Cookies from "js-cookie";

export class Consent {
  static cookieBaseName = 'teachfe-cookie-preferences';
  static cookieVersion = 1;
  static cookieLifetimeInDays = 90;
  static cookieAcceptanceBannerId = 'cookie-banner-accepted';
  static cookieRejectionBannerId = 'cookie-banner-rejected';

  static get cookieName() {
    return Consent.cookieBaseName + '-v' + Consent.cookieVersion;
  }

  
  init(id) {
    // let startTime = performance.now()
    const acceptCookies = document.getElementById(Consent.cookieAcceptanceBannerId).style.display;
    const rejectCookies =  document.getElementById(Consent.cookieRejectionBannerId).style.display;
    const acceptCookiesHeight= document.getElementById(Consent.cookieAcceptanceBannerId).offsetHeight;
    const rejecttCookiesHeight= document.getElementById(Consent.cookieRejectionBannerId).offsetHeight;
    const idGeneral= document.getElementById(id).style.display;

    const v = Cookies.get(Consent.cookieName);
    if (v !== null && v !== undefined) {
      idGeneral = 'none';
      acceptCookies = 'none';
      rejectCookies = 'none';
      const granted = JSON.parse(v);

      let cookieAcceptRejectHeight = 0;

      if (granted.isGranted) {
        acceptCookies = 'block';
        cookieAcceptRejectHeight = acceptCookiesHeight
        this.enableCookies();
      } else {
        rejectCookies = 'block';
        cookieAcceptRejectHeight = rejecttCookiesHeight;
        this.removeCookies();
      }

      if (granted.confirmationHidden) {
        acceptCookies = 'none';
        rejectCookies = 'none';
      } else {
        this.saveConsentPreferences('cookie-banner', {isGranted: granted.isGranted, 
          confirmationHidden: true,
        });
        document.getElementById('footer').style.marginBottom =
          cookieAcceptRejectHeight + 'px';
      }
    } else {
      idGeneral = 'block';
      const cookieBannerHeight =
      document.getElementById('cookie-banner').offsetHeight;
      document.getElementById('footer').style.marginBottom = cookieBannerHeight + 'px';
      acceptCookies = 'none';
      rejectCookies = 'none';
    }
    // var endTime = performance.now()
    // console.log(`Call to doSomething took ${endTime - startTime} milliseconds`)
  }
  
  enableCookies() {
    const v = Cookies.get(Consent.cookieName);
    if (v !== null && v !== undefined) {
      const granted = JSON.parse(v);
      if (granted.isGranted) {
        gtag('consent', 'default', {
          ad_storage: 'granted',
          analytics_storage: 'granted',
        });
      }
    }
  }

  removeCookies() {
    gtag('consent', 'update', {
      ad_storage: 'denied',
      analytics_storage: 'denied',
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
      sameSite: 'Lax',
    });

    document.getElementById(id).style.display = 'none';
  }

  consentAccepted(id, showBannerOnNextPage = false) {
    acceptCookies ='block';
    const cookieBannerAcceptedHeight = acceptCookiesHeight;
    document.getElementById('footer').style.marginBottom =
      cookieBannerAcceptedHeight + 'px';
    document.getElementById(Consent.cookieAcceptanceBannerId).focus();
    this.enableCookies();
    this.saveConsentPreferences(id, {
      isGranted: true,
      confirmationHidden: !showBannerOnNextPage,
    });
  }

  consentRejected(id, showBannerOnNextPage = false) {
    rejectCookies = 'block';
    const cookieBannerRejectedHeight = rejecttCookiesHeight;
    document.getElementById('footer').style.marginBottom =
      cookieBannerRejectedHeight + 'px';
    document.getElementById(Consent.cookieRejectionBannerId).focus();
    this.removeCookies();
    this.saveConsentPreferences(id, {
      isGranted: false,
      confirmationHidden: !showBannerOnNextPage,
    });
  }

  hideCookieConfirmation(id) {
    acceptCookies = 'none';
    rejectCookies = 'none';
    document.getElementById('footer').style.marginBottom = '0px';
  }
}