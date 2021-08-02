
export class Analytics {

    sendAnalytics(category, action, label) {
        console.log('analytics', {
            hitType: 'event',
            eventCategory: category,
            eventAction: action,
            eventLabel: label
        });

        gtag('event', action, {
            'event_category': category,
            'event_label': label
        });
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

}