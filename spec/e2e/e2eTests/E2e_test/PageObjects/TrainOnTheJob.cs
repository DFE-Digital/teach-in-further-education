using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class TrainOnTheJobPage
    {
        private readonly IWebDriver driver;
        public TrainOnTheJobPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement ApplyForFEJobLink
        {
            get { return driver.FindElement(By.LinkText("How to apply for an FE teaching job")); }
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

        public void ClickApplyForFEJobLink()
        {
            ApplyForFEJobLink.Click();
        }

        public bool EmailLinkDisplayed()
        {
            return EmailLink.Displayed;
        }

        #endregion
    }
}
