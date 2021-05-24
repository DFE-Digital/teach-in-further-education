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
                 adviceBody {
                     childMarkdownRemark {
                         html
                     }
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
                     gatsbyImageData(width: 317, height: 233)
                 }
             }
             ... on ContentfulSteps {
                 id
                 title
                 isAccordion
                 internal {
                     type
                 }
                 steps {
                     contentful_id
                     title
                     adviceBody {
                         childMarkdownRemark {
                             html
                         }
                     }
                 }
             }
             ... on ContentfulTableOfContents {
                 id
                 title
                 internal {
                     type
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
