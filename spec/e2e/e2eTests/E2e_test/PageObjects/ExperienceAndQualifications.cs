using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class ExperienceAndQualificationsPage
    {
        private readonly IWebDriver driver;
        public ExperienceAndQualificationsPage(IWebDriver driver)
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

        #endregion

        #region Actions

        public bool ContentExpAndQualificationsDisplayed()
        {
            return _ = MainContent.Displayed;
        }

        public bool ValidationErrorMessageDisplayed()
        {
            return _ = ValidationErrorMessage.Displayed;
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

        #endregion
    }
}
