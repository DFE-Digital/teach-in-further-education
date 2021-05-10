import React from 'react'

const Accordion = ({ title, children }) => {
    return (
        <div className="govuk-accordion" data-module="govuk-accordion" id="accordion-default">
            <div className="govuk-accordion__section ">
                <div className="govuk-accordion__section-header">
                <h2 className="govuk-accordion__section-heading">
                    <span className="govuk-accordion__section-button" id="accordion-default-heading-1">
                    {title}
                    </span>
                </h2>
                </div>
                <div id="accordion-default-content-1" className="govuk-accordion__section-content" aria-labelledby="accordion-default-heading-1">
                <p className='govuk-body'>{children}</p>
                </div>
            </div>
        </div>
    )
}

export default Accordion;