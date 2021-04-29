import React from "react"
import NavLink from "./NavLink"
import { graphql, useStaticQuery } from "gatsby"

export const PureHeader = ({location, data}) => {
  return (
    <header className="govuk-header" role="banner" data-module="govuk-header">
      <div className="govuk-header__container govuk-width-container">
        <div className="govuk-header__logo">
          <a href="/" className="govuk-header__link govuk-header__link--homepage">
            <img src="/assets/images/logo.svg" alt="further education logo" />
          </a>
        </div>
        <button type="button" className="govuk-header__menu-button govuk-js-header-toggle" aria-controls="navigation"
                aria-label="Show or hide navigation menu">Menu
        </button>
        <nav>
          <ul id="navigation" className="govuk-header__navigation" aria-label="Navigation menu">
            {data.contentfulNavigation.pages.map(p => {
              return <NavLink className="govuk-header__navigation-item" key={p.contentful_id} data={{location, slug: p.slug, title: p.title}} />
            })}
            {data.contentfulNavigation.callToActions.map(cta => {
              return <li key={cta.contentful_id} className="govuk-header__navigation-item"><a key={cta.contentful_id} href={cta.slug} className="govuk-button">{cta.title}</a></li>
            })}
          </ul>
        </nav>
      </div>
    </header>
  )
}

export const Header = ({location}) => {
  const data = useStaticQuery(graphql`
      query NavQuery {
          contentfulNavigation(title: {eq: "Main"}) {
              pages {
                  contentful_id
                  slug
                  title
              }
              callToActions {
                  contentful_id
                  slug
                  title
              }
          }
      }
  `)
  return <PureHeader location={location} data={data} />

}

export default Header