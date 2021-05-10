import React from "react"

const classMap = new Map([
  ["Start", ""],
  ["Primary", ""],
  ["Secondary", "govuk-button--secondary"],
  ["Warning", "govuk-button--warning"],
])

export const CTA = ({ data }) => {
  const { ctaType } = data.ctaType
  if (ctaType === "Start") {
    return (
      <a
        href={data.slug}
        role="button"
        draggable="false"
        className="govuk-button govuk-button--start"
        data-module="govuk-button"
      >
        {data.title}
        <svg
          className="govuk-button__start-icon"
          xmlns="http://www.w3.org/2000/svg"
          width="17.5"
          height="19"
          viewBox="0 0 33 40"
          aria-hidden="true"
          focusable="false"
        >
          <path fill="currentColor" d="M0 0h13l20 20-20 20H0l20-20z" />
        </svg>
      </a>
    )
  } else {
    const className = classMap[ctaType]

    return (
      <a
        href={data.slug}
        className={"govuk-button " + className}
        data-module="govuk-button"
      >
        {data.title}
      </a>
    )
  }
}

export default CTA
