import React from "react"
import Advice from "./Advice"

export const Accordion = ({ data, ...props }) => {
  return (<div {...props}>
    <div className="govuk-accordion" data-module="govuk-accordion" id="accordion-default">
      {
        data.steps.map((s, i, arr) => {
          return (
            <div ey={"accordian_section-" + i} className="govuk-accordion__section">
              <div className="govuk-accordion__section-header">
                <h2 className="govuk-accordion__section-heading">
                    <span className="govuk-accordion__section-button" id={"accordion-heading-section-" + i}>
                    {s.title}
                    </span>
                </h2>
              </div>
              <div id={"accordion-content-section-" + i} className="govuk-accordion__section-content"
                   aria-labelledby={"accordion-heading-section-" + i}>
                <Advice key={s.contentful_id} data={s} />
              </div>
            </div>)
        })
      }
    </div>
  </div>)
}

export default Accordion