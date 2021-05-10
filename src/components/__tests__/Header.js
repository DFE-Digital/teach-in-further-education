import React from "react"
import { render } from "@testing-library/react"
import { PureHeader as Header } from "../Header"

describe("Header", () => {
  it("renders correctly", () => {
    const data = {
      contentfulNavigation: {
        pages: [
          { contentful_id: 1, slug: "/ways-to-train", title: "Ways to train" },
        ],
        callToActions: [
          { contentful_id: 2, slug: "/get-support", title: "Get support" },
        ],
      },
    }

    const location = { pathname: "/ways-to-train" }

    const { container, getByText } = render(
      <Header location={location} data={data} />
    )

    expect(getByText("Get support")).toHaveAttribute("href", "/get-support")
    expect(getByText("Ways to train")).toHaveAttribute("href", "/ways-to-train")
  })
})
