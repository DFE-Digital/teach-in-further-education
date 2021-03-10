import RichText from "./RichText"
import React from "react"

export default function Advice({ data, ...props }) {
    return <div {...props}>
      <h2 className="govuk-heading-l">{data.title}</h2>
      <RichText data={data.advicebody.raw} />
    </div>
}