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

        public IWebElement FullListOfFeQualifications
        {
            get { return driver.FindElement(By.LinkText("Here's a list of popular teacher training courses")); }
        }

        public IWebElement StudentFinanceLink
        {
            get { return driver.FindElement(By.LinkText("Visit the student finance website")); }
        }

        public IWebElement BursariesLink
        {
            get { return driver.FindElement(By.PartialLinkText("Information about bursaries")); }
        }

        public IWebElement TrainOnTheJobLink
        {
            get { return driver.FindElement(By.LinkText("training on the job")); }
        }

        public IWebElement EmailLink
        {
            get { return driver.FindElement(By.LinkText("Teach.FE@education.gov.uk")); }
        }

        #endregion

        #region Actions

        public bool ContentTrainInYourOwnTimeDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickFullListOfFeQualifications()
        {
            FullListOfFeQualifications.Click();
        }

        public void ClickStudentFinanceLink()
        {
            StudentFinanceLink.Click();
        }

        public void ClickBursariesLink()
        {
            BursariesLink.Click();
        }

        public void ClickTrainOnTheJobLink()
        {
            TrainOnTheJobLink.Click();
        }

        public bool EmailLinkDisplayed()
        {
            return EmailLink.Displayed;
        }

        #endregion
    }
}
