import { initAll } from 'govuk-frontend'

export function initSite() {
    console.log('init')
    initAll()
}

export function onShowStep(i) {
    const currentStep = document.getElementsByClassName("app-stepper-header step-selected")[0]
    if(currentStep) {
        console.log(currentStep.id)
        currentStep.classList.remove("step-selected");
        const link = currentStep.childNodes[0];
        console.log(link.href)
        const currentStepContent = document.getElementById(link.href.replace('#',''))
        currentStepContent.style.display = 'none';
    }

    const header = document.getElementById("step_header_" + i)
    const content = document.getElementById("step_" + i)
    header.classList.add("step-selected");
    content.style.display = 'block';
}

window.site = {
    initSite,
    onShowStep,
}
