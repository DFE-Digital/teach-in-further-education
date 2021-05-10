import React, { useState } from "react"
import Advice from "./Advice"

export const Steps = ({ data, ...props }) => {
  const [visible, setVisible] = useState(0)

  const onShow = id => {
    setVisible(id)
  }

  return (
    <div {...props}>
      <ul key={"steps"} className="app-stepper-header">
        {data.steps.map((s, i, arr) => {
          const cls = visible === i ? "step-selected" : null
          return (
            <>
              <li
                key={"step_header" + i}
                className={cls}
                onClick={e => onShow(i)}
              >
                <a href={"#step" + i}>{i + 1 + ". " + s.title}</a>
              </li>
              {arr.length - 1 !== i ? (
                <img
                  src="/assets/images/basic-arrow.svg"
                  alt="arrow"
                  aria-hidden="true"
                />
              ) : null}
            </>
          )
        })}
      </ul>
      {data.steps.map((s, i) => {
        const style = visible === i ? null : { display: "none" }
        return (
          <div key={"step_panel" + i} id={"step" + i} style={style}>
            <Advice key={s.contentful_id} data={s} />
          </div>
        )
      })}
    </div>
  )
}

export default Steps
