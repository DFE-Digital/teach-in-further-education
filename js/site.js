import { initAll } from 'govuk-frontend'
import { Consent } from './consent'
import { Analytics } from "./analytics";
import { Header } from "./header";

const consent = new Consent()
const analytics = new Analytics()
const header = new Header()

export function initSite(bannerId, headerId) {
    initAll()
    consent.init(bannerId)
    header.init(headerId)
}

export function onShowStep(i) {
    const currentStep = document.getElementsByClassName("app-stepper-header step-selected")[0]
    if(currentStep) {
        currentStep.classList.remove("step-selected");
        const link = currentStep.childNodes[0];
        const currentStepContent = document.getElementById(link.href.replace('#',''))
        currentStepContent.style.display = 'none';
    }

    const header = document.getElementById("step_header_" + i)
    const content = document.getElementById("step_" + i)
    header.classList.add("step-selected");
    content.style.display = 'block';
}

export function submitQuestionForm(e) {
    e.preventDefault();
    const data = new FormData(e.target);
    const answer = data.get("answer");
    analytics.raiseQuestionAnswerSubmit(answer);
    e.target.reset();
    window.location.assign("/" + answer + ".html");
    return answer;
}


window.site = {
    initSite,
    onShowStep,
    submitQuestionForm,
    consent: consent,
    analytics: analytics
}
