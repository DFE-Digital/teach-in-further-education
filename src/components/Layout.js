import React from "react"
import { Footer } from "./Footer"
import { Header } from "./Header"

export function Layout({children, ...props}) {
  return (
    <>
      <a href="#main-content" className="govuk-skip-link">Skip to main content</a>

      <Header key="header" {...props}/>

      <div className="govuk-width-container">
        <div className="govuk-phase-banner">
          <p className="govuk-phase-banner__content">
            <strong className="govuk-tag govuk-phase-banner__content__tag">
              alpha
            </strong>
            <span className="govuk-phase-banner__text">
          This is a new service – your <a className="govuk-link" href="/feedback">feedback</a> will help us to improve it.
        </span>
          </p>
        </div>
        <main className="govuk-main-wrapper" id="main-content" role="main">
          {children}
        </main>
      </div>

      <Footer key="footer" {...props} />
    </>
  )
}

