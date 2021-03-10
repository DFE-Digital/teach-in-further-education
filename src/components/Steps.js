import React from "react"
import Advice from "./Advice"

export default function Steps({ data, ...props }) {
  return <div {...props} className="app-steps">
    <div className="govuk-tabs" data-module="govuk-tabs">
      <h2 className="govuk-tabs__title">
        {data.title}
      </h2>
      <ul className="govuk-tabs__list">
      {
        data.steps.map((s,i) => {
          const cls = i === 0 ? "govuk-tabs__list-item govuk-tabs__list-item--selected" : "govuk-tabs__list-item"
          return <li key={"step_header" + i} className={cls}>
            <a className="govuk-tabs__tab" href={"#step" + i}>{s.title}</a>
          </li>
        })
      }
      </ul>
      {
        data.steps.map((s, i) => {
          const cls = i === 0 ? "govuk-tabs__panel" : "govuk-tabs__panel govuk-tabs__panel--hidden"
          return <div key={"step_panel" + i} className={cls} id={"step" + i}>
            <Advice key={s.contentful_id} data={s}/>
          </div>
        })
      }
  </div>
  </div>
}