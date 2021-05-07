import React from 'react'

const Accordion = (props) => {
    return (
        <div class="govuk-accordion" data-module="govuk-accordion" id="accordion-default">
            <div class="govuk-accordion__section ">
                <div class="govuk-accordion__section-header">
                <h2 class="govuk-accordion__section-heading">
                    <span class="govuk-accordion__section-button" id="accordion-default-heading-1">
                    Writing well for the web
                    </span>
                </h2>
                </div>
                <div id="accordion-default-content-1" class="govuk-accordion__section-content" aria-labelledby="accordion-default-heading-1">
                <p class='govuk-body'>This is the content for Writing well for the web.</p>
                </div>
            </div>
        </div>
    )
}

export default Accordion;