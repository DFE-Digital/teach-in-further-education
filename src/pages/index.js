import React from "react"
import { graphql } from "gatsby"
import Page from "../templates/page"


export default function Home(props) {
    return <Page {...props} />
}

export const staticQuery = graphql` {
     contentfulPage(title: { eq: "Home" }) {
            title,
            introduction {
                raw
            },
            hero {
              heroText {
                raw
              }
              heroMedia {
                  title
                  fixed(width: 476, height: 350) {
                    ...GatsbyContentfulFixed
                  }
              }
            },
            blocks {
                title
                advicebody {
                    raw
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
