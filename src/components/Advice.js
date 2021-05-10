import React from "react"

export const Advice = ({ id, data, ...props }) => {
  return (
    <div id={id} {...props}>
      <h2 className="govuk-heading-l">{data.title}</h2>
      <div
        dangerouslySetInnerHTML={{
          __html: data.adviceBody.childMarkdownRemark.html,
        }}
      />
    </div>
  )
}

export default Advice
