import React from "react"

export default function NavLink(props) {
  const { location, slug, title } = props.data
  const className =  location?.pathname === ("/" + slug) ? "govuk-header__link govuk-header__navigation-item--active" : "govuk-header__link"
  return (<li className="govuk-header__navigation-item">
    <a className={className} href={slug}>
      {title}
    </a>
  </li>)
}