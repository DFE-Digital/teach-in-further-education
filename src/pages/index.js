import React from "react"
import { graphql } from "gatsby"
import Page from "../templates/page"


export default function Home(props) {
    return <Page key="home" {...props} />
}

export const staticQuery = graphql` {
     contentfulPage(title: { eq: "Home" }) {
            title,
         blocks {
             ... on ContentfulAdvice {
                 id
                 internal {
                     type
                 }
                 contentful_id
                 advicebody {
                     raw
                 }
                 title
             }
             ... on ContentfulHeroBanner {
                 id
                 internal {
                     type
                 }
                 contentful_id
                 heroText {
                     raw
                 }
                 heroMedia {
                     title
                     fixed(width: 476, height: 350) {
                         ...GatsbyContentfulFixed
                     }
                 }
             }
             ... on ContentfulSteps {
                 id
                 title
                 internal {
                     type
                 }
                 steps {
                     contentful_id
                     title
                     advicebody {
                         raw
                     }
                 }
             }
         },
            callToActions {
                ctaType {
                    ctaType
                }
                title
                slug
            }
        } 
      }  
         
`
