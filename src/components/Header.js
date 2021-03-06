import React from "react"
import { Navigation } from "./Navigation"

export function Header(props) {
  return (
    <header className="govuk-header" role="banner" data-module="govuk-header">
      <div className="govuk-header__container govuk-width-container">
        <div className="govuk-header__logo">
          <a href="/" className="govuk-header__link govuk-header__link--homepage">
           <img src="/assets/images/logo.svg" alt="further education logo" />
          </a>
        </div>
        <Navigation {...props}/>
      </div>
    </header>
  )
}