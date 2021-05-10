import React from "react"
import { render } from "@testing-library/react"
import Accordion from "../Accordion"

describe("Accordion", () => {
  it("renders correctly", () => {
    const { getByText } = render(
      <Accordion title="test title" children="test context" />
    )

    expect(getByText("test title")).toBeVisible()
  })
})
