import { initAll } from 'govuk-frontend'
import { Consent } from './consent'

const consent = new Consent()

export function initSite(bannerId) {
    initAll()
    consent.init(bannerId)
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
    window.location.replace("/" + data.get("answer") + ".html")
}



window.site = {
    initSite,
    onShowStep,
    submitQuestionForm,
    consent: consent
}
