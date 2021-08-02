
export class Analytics {

    sendAnalytics(category, action, label) {
        ga('send', {
            hitType: 'event',
            eventCategory: 'Videos',
            eventAction: 'play',
            eventLabel: 'Fall Campaign'
        });
    }

    raiseQuestionSelected(questionText) {
        this.sendAnalytics('question', 'selected', questionText)
    }

    raiseQuestionAnswerSubmit(questionText) {
        this.sendAnalytics('question', 'submitted', questionText)
    }

}