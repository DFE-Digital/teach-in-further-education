using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class HelpAndAdvicePage
    {
        private readonly IWebDriver driver;
        public HelpAndAdvicePage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement EmailLink
        {
            get { return driver.FindElement(By.LinkText("Teach.FE@education.gov.uk")); }
        }

        #endregion

        #region Actions

        public bool ContentTrainOnTheJobDisplayed()
        {
            return MainContent.Displayed;
        }

        public bool EmailLinkDisplayed()
        {
            return EmailLink.Displayed;
        }

        #endregion
    }
}
