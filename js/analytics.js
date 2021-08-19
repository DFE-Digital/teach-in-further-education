
export class Analytics {

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