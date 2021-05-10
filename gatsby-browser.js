import "./src/styles/global.sass"
import * as govuk from "govuk-frontend"

export function onInitialClientRender() {
  console.log("init")
  govuk.initAll()
}
