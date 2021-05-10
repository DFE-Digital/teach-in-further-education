import React from 'react'

const Button = ({onClick, children}) => {
    return (
        <button onClick={onClick} className="govuk-button" data-module="govuk-button">
            {children}
        </button>
    )
}

export default Button;