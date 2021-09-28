import Cookies from 'js-cookie'

export class Consent {

    static cookieBaseName = 'teachfe-cookie-preferences';
    static cookieVersion = 1;
    static cookieLifetimeInDays = 90;

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
                this.enableCookies();
            } else {
                this.removeCookies();
            }
        } else {
            document.getElementById(id).style.display = 'block'
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

        document.getElementById(id).style.display = 'none'
    }

    consentAccepted(id) {
        this.enableCookies();
        this.saveConsentPreferences(id,{ isGranted: true })
    }

    consentRejected(id) {
        this.removeCookies()
        this.saveConsentPreferences(id,{ isGranted: false })
    }
}