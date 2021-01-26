import React from "react"
import { Footer } from "./Footer"
import { Header } from "./Header"
import { PhaseBanner } from "./PhaseBanner"

export function Layout({children, ...props}) {
  return (
    <div>
      <a href="#main-content" className="govuk-skip-link">Skip to main content</a>

      <Header key="header" {...props}/>

      <div className="govuk-width-container">
        <PhaseBanner />
        <main className="govuk-main-wrapper" id="main-content" role="main">
          {children}
        </main>
      </div>

      <Footer key="footer" {...props} />
    </div>
  )
}

