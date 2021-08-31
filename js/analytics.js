import Cookies from 'js-cookie'
import {Consent} from "./consent";

export class Analytics {

    static setup(tag) {

        const v = Cookies.get(Consent.cookieName);
        let consentValue = 'denied';

        if(v !== null && v !== undefined) {
            const granted = JSON.parse(v)
            if(granted.isGranted) {
                consentValue = 'granted'
            }
        }

        gtag('consent', 'default', {
            'ad_storage': consentValue,
            'analytics_storage': consentValue
        });

        gtag('js', new Date());
        gtag('config', tag);
        gtag('send', 'pageview')
    }

    sendAnalytics(category, action, label) {
        gtag('event', action, {
            'event_category': category,
            'event_label': label
        });
    }

    internalNavigation(hashLink, title) {
        gtag('event', 'page_view', {
            page_title: title,
            page_location: window.location.href,
            page_path: window.location.pathname + '#' + title.replace(' ', '-')
        })
    }

    raiseQuestionSelected(questionText) {
        this.sendAnalytics('question', 'selected', questionText)
    }

    raiseQuestionAnswerSubmit(questionText) {
        this.sendAnalytics('question', 'submitted', questionText)
    }

    raiseExitPointEvent(url) {
        this.sendAnalytics('exitPoint', 'click', url)
    }

    trackAccordionExpansion(id) {
        const accordion = document.getElementById(id);
        const openedElements =
            Array.from(accordion.querySelectorAll('.govuk-accordion__section--expanded'))
                .map(e => {
                    return e.getAttribute("data-label")
                }).join(',')

        this.sendAnalytics('accordion', 'expanded', openedElements)
    }
}

window.analytics = {
    setup: Analytics.setup
}