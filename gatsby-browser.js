import "./src/styles/global.sass"
import * as govuk from "govuk-frontend"
import React from "react"
import { Layout } from "./src/components/Layout"

// export function wrapRootElement (data) {
//   const {element, props} = data
//   // props provide same data to Layout as Page element will get
//   // including location, data, etc - you don't need to pass it
//   return <Layout {...props}>{element}</Layout>
// }

export function onClientEntry() {
  govuk.initAll()
}

