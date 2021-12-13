import Cookies from 'js-cookie'

export class Consent {

    static cookieBaseName = 'teachfe-cookie-preferences';
    static cookieVersion = 1;
    static cookieLifetimeInDays = 90;
    static cookieAcceptanceBannerId = 'cookie-banner-accepted';
    static cookieRejectionBannerId = 'cookie-banner-rejected';

    static get cookieName() {
        return (
            Consent.cookieBaseName + '-v' + Consent.cookieVersion
        );
    }

    init(id) {
        const v = Cookies.get(Consent.cookieName)
        if(v !== null && v !== undefined) {
            document.getElementById(id).style.display = 'none'
            const granted = JSON.parse(v)

            if(granted.isGranted) {
                document.getElementById(Consent.cookieAcceptanceBannerId).style.display = 'block'
                this.enableCookies();
            } else {
                document.getElementById(Consent.cookieRejectionBannerId).style.display = 'block'
                this.removeCookies();
            }

            if (granted.confirmationHidden) {
                document.getElementById(Consent.cookieAcceptanceBannerId).style.display = 'none'
                document.getElementById(Consent.cookieRejectionBannerId).style.display = 'none'
            } else {
                this.saveConsentPreferences('cookie-banner',{ isGranted: granted.isGranted, confirmationHidden: true });
            }
        } else {
            document.getElementById(id).style.display = 'block'
            document.getElementById(Consent.cookieAcceptanceBannerId).style.display = 'none'
            document.getElementById(Consent.cookieRejectionBannerId).style.display = 'none'
        }
    }

    enableCookies(){

        const v = Cookies.get(Consent.cookieName)
        if(v !== null && v !== undefined) {
            const granted = JSON.parse(v)
            if(granted.isGranted) {
                gtag('consent', 'default', {
                    'ad_storage': 'granted',
                    'analytics_storage': 'granted'
                });

                // SKD user has enabled the cookies so find the hotjar script by id that is not currently activated

                var script = document.getElementById('hotjar-script'), s, y, attrib,
                    documentFragment = document.createDocumentFragment();

                // SKD create a new element for the script
                s = document.createElement('script');
                s.type = 'text/javascript';
                for (y = 0; y < script.attributes.length; y++) {
                    attrib = script.attributes[y];
                    if (attrib.specified) {
                        if ((attrib.name != 'type') && (attrib.name != 'class')){
                            s.setAttribute(attrib.name, attrib.value);
                        }
                    }
                }

                // SKD inject the script back into the head.  Hot jar will now run when user changes page or refreshes.
                s.innerHTML = script.innerHTML;
                documentFragment.appendChild(s);
                document.head.appendChild(documentFragment);
            }

        }
    }

    removeCookies() {
        gtag('consent', 'update', {
            'ad_storage': 'denied',
            'analytics_storage': 'denied'
        });

        const cookies = Cookies.get()


        for(const cookie in cookies) {
            if(cookie !== Consent.cookieName) {
                Cookies.remove(cookie)
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
        document.getElementById(Consent.cookieAcceptanceBannerId).style.display = 'block'
        document.getElementById(Consent.cookieAcceptanceBannerId).focus()
        this.enableCookies();
        this.saveConsentPreferences(id,{ isGranted: true, confirmationHidden: !showBannerOnNextPage })
    }

    consentRejected(id, showBannerOnNextPage = false) {
        document.getElementById(Consent.cookieRejectionBannerId).style.display = 'block'
        document.getElementById(Consent.cookieRejectionBannerId).focus()
        this.removeCookies()
        this.saveConsentPreferences(id,{ isGranted: false, confirmationHidden: !showBannerOnNextPage })
    }

    hideCookieConfirmation(id) {
        document.getElementById(Consent.cookieAcceptanceBannerId).style.display = 'none'
        document.getElementById(Consent.cookieRejectionBannerId).style.display = 'none'
    }
}