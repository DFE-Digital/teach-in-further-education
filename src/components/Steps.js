import React from "react"
import Advice from "./Advice"

export default function Steps({ data, ...props }) {
  return <div {...props}>
      <ul className="app-stepper-header">
      {
        data.steps.map((s,i) => {
          return <li key={"step_header" + i}>
            <a href={"#step" + i}>{s.title}</a>
          </li>
        })
      }
      </ul>
      {
        data.steps.map((s, i) => {
          return <div key={"step_panel" + i} id={"step" + i}>
            <Advice key={s.contentful_id} data={s}/>
          </div>
        })
      }
  </div>
}