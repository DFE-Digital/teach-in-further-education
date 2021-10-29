using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class TrainInYourOwnTimePage
    {
        private readonly IWebDriver driver;
        public TrainInYourOwnTimePage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement NoneRadioButton
        {
            get { return driver.FindElement(By.ClassName("govuk-radios__input")); }
        }

        public IWebElement GcseButton
        {
            get { return driver.FindElement(By.CssSelector("#qual-form-group > fieldset > div > div:nth-child(2) > input")); }
        }

        public IWebElement AlevelButton
        {
            get { return driver.FindElement(By.CssSelector("#qual-form-group > fieldset > div > div:nth-child(3) > input")); }
        }

        public IWebElement DegreeButton
        {
            get { return driver.FindElement(By.CssSelector("#qual-form-group > fieldset > div > div:nth-child(4) > input")); }
        }

        public IWebElement SubmitButton
        {
            get { return driver.FindElement(By.Id("question-submit-qNRtpmv245PlK1GAu8Mzm")); }
        }

        public IWebElement ValidationErrorMessage
        {
            get { return driver.FindElement(By.Id("error-message")); }
        }

        public IWebElement FinancialSupportToTrainLink
        {
            get { return driver.FindElement(By.PartialLinkText("You might be able to start work")); }
        }

        public IWebElement WhatLevelsMeanLink
        {
            get { return driver.FindElement(By.LinkText("What levels mean")); }
        }

        public IWebElement EmailLink
        {
            get { return driver.FindElement(By.LinkText("Teach.FE@education.gov.uk")); }
        }

        public IWebElement BursariesAvailableLink
        {
            get { return driver.FindElement(By.PartialLinkText("There are bursaries available")); }
        }

        public IWebElement FullListOfFeCoursesLink
        {
            get { return driver.FindElement(By.PartialLinkText("A full list of all FE courses")); }
        }

        #endregion

        #region Actions

        public bool ContentExpAndQualificationsDisplayed()
        {
            return _ = MainContent.Displayed;
        }

        public bool ValidationErrorMessageDisplayed()
        {
            return ValidationErrorMessage.Displayed;
        }

        public void ClickNoneRadioButton()
        {
            NoneRadioButton.Click();
        }

        public void ClickGcseButton()
        {
            GcseButton.Click();
        }

        public void ClickAlevelsButton()
        {
            AlevelButton.Click();
        }

        public void ClickDegreeButton()
        {
            DegreeButton.Click();
        }

        public void ClickSubmitButton()
        {
            SubmitButton.Click();
        }

        public void ClickFinancialSupportToTrainLink()
        {
            FinancialSupportToTrainLink.Click();
        }

        public void ClickWhatLevelsMeanLink()
        {
            WhatLevelsMeanLink.Click();
        }

        public void ClickBursariesAvailableLink()
        {
            BursariesAvailableLink.Click();
        }

        public void ClickFullListOfFeCoursesLink()
        {
            FullListOfFeCoursesLink.Click();
        }
        #endregion
    }
}
