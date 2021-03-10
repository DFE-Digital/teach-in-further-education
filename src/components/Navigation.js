import NavLink from "./NavLink"
import React from "react"
import { useStaticQuery, graphql } from "gatsby"

export function Navigation({ location }) {
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

  return (
    <>
      <button type="button" className="govuk-header__menu-button govuk-js-header-toggle" aria-controls="navigation"
              aria-label="Show or hide navigation menu">Menu
      </button>
      <nav style={{display: "contents"}}>
        <ul id="navigation" className="govuk-header__navigation" aria-label="Navigation menu">
          {data.contentfulNavigation.pages.map(p => {
            return <NavLink key={p.contentful_id} data={{location, slug: p.slug, title: p.title}} />
          })}
        </ul>
        {data.contentfulNavigation.callToActions.map(cta => {
          return <a key={cta.contentful_id} href={cta.slug} className="govuk-button govuk-header__navigation-item">{cta.title}</a>
        })}
      </nav>

    </>
  )
}