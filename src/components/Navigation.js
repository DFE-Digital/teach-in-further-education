import NavLink from "./NavLink"
import React from "react"

export function Navigation({ location }) {
  return (
    <div>
      <button type="button" className="govuk-header__menu-button govuk-js-header-toggle" aria-controls="navigation"
              aria-label="Show or hide navigation menu">Menu
      </button>
      <nav>
        <ul id="navigation" className="govuk-header__navigation " aria-label="Navigation menu">
          <NavLink key="get-into-fe" data={{location, slug: "/", title: "Get into FE"}} />
          <NavLink key="why-fe" data={{location, slug: "/why_further_education", title: "Why FE?"}} />
          <NavLink key="working-in-fe" data={{location, slug: "/working_in_further_education", title: "Working in FE"}} />
          <NavLink key="quals-in-fe" data={{location, slug: "/further_education_qualifications", title: "Qualifications to work in FE"}} />
          <NavLink key="support" data={{location, slug: "/support", title: "Support"}} />
        </ul>
      </nav>
    </div>
  )
}