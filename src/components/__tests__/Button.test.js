import React from "react"
import { render } from "@testing-library/react"
import Button from "../Button"

describe("Button", () => {
  it("renders correctly", () => {
    const { getByText } = render(<Button>Click me</Button>)

    expect(getByText("Click me")).toBeVisible()
  })
})
