using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class SignUpToNewsletter
    {
        private readonly IWebDriver driver;
        public SignUpToNewsletter(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement SignUpToNewsletterButton
        {
            get { return driver.FindElement(By.CssSelector("button[id='2PkxkCxeXtOc9yvI3aok46']")); }
        }

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement EmailAddressLink
        {
            get { return driver.FindElement(By.LinkText("TeachFE.newsletter@education.gov.uk")); }
        }

        #endregion

        #region Actions

        public void ClickSignUpToNewsletterButton()
        {
            SignUpToNewsletterButton.Click();
        }

        public bool ContentSignUpToNewsletterDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickEmailAddressLink()
        {
            EmailAddressLink.Click();
        }

        #endregion
    }
}
