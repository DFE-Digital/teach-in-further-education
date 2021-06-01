import React from "react"
import { render } from "@testing-library/react"
import Accordion from "../Accordion"

describe("Accordion", () => {
  it("renders correctly", () => {
    const data = {
      steps: [
        {
          title: "test title", contentful_id: "c_id", adviceBody: {
            childMarkdownRemark: {
              html: "<p>Test data</p>"
            }
          }
        }
      ]
    }

    const { getByText } = render(<Accordion data={data} />)

    expect(getByText("test title")).toBeVisible()
  })
})