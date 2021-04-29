import React from "react"

export const NavLink = ({data}) => {
  const { location, slug, title } = data
  const className =  location?.pathname === ("/" + slug) ? "govuk-header__link govuk-header__navigation-item--active" : "govuk-header__link"
  return (<li className="govuk-header__navigation-item">
    <a className={className} href={slug}>
      {title}
    </a>
  </li>)
}

export default NavLink