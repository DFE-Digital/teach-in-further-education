import React from "react"
import PropTypes from "prop-types"
export default function HTML(props) {
  return (
    <html {...props.htmlAttributes} lang="en" className="govuk-template">
      <head>
        <meta charSet="utf-8" />
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1, viewport-fit=cover"
        />
        <meta name="theme-color" content="red" />

        <meta httpEquiv="X-UA-Compatible" content="IE=edge" />

        <link
          rel="shortcut icon"
          sizes="16x16 32x32 48x48"
          href="/favicon.ico"
          type="image/x-icon"
        />
        <link
          rel="mask-icon"
          href="/assets/images/govuk-mask-icon.svg"
          color="blue"
        />
        <link
          rel="apple-touch-icon"
          sizes="180x180"
          href="/assets/images/govuk-apple-touch-icon-180x180.png"
        />
        <link
          rel="apple-touch-icon"
          sizes="167x167"
          href="/assets/images/govuk-apple-touch-icon-167x167.png"
        />
        <link
          rel="apple-touch-icon"
          sizes="152x152"
          href="/assets/images/govuk-apple-touch-icon-152x152.png"
        />
        <link
          rel="apple-touch-icon"
          href="/assets/images/govuk-apple-touch-icon.png"
        />
        <meta
          property="og:image"
          content="/assets/images/govuk-opengraph-image.png"
        />

        {props.headComponents}
      </head>
      <body {...props.bodyAttributes} className="govuk-template__body">
        <script
          dangerouslySetInnerHTML={{
            __html: `
            document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');
        `,
          }}
        />
        {props.preBodyComponents}
        <div
          key={`body`}
          id="___gatsby"
          dangerouslySetInnerHTML={{ __html: props.body }}
        />
        {props.postBodyComponents}
      </body>
    </html>
  )
}

HTML.propTypes = {
  htmlAttributes: PropTypes.object,
  headComponents: PropTypes.array,
  bodyAttributes: PropTypes.object,
  preBodyComponents: PropTypes.array,
  body: PropTypes.string,
  postBodyComponents: PropTypes.array,
}
