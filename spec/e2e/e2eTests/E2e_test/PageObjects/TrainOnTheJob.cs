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

        public IWebElement TrainInYourOwnTimeLink
        {
            get { return driver.FindElement(By.LinkText("Train in your own time")); }
        }

        public IWebElement AzEmployersLink
        {
            get { return driver.FindElement(By.PartialLinkText("The Association of Colleges")); }
        }

        public IWebElement OurMembersLink
        {
            get { return driver.FindElement(By.PartialLinkText("The Association of Employment Learning Providers'")); }
        }

        public IWebElement AocJobsLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find a job in FE on the Association of Colleges")); }
        }

        public IWebElement FindAnFeTeachingJobLink
        {
            get { return driver.FindElement(By.LinkText("Find a further education teaching job")); }
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

        public void ClickAzEmployersLink()
        {
            AzEmployersLink.Click();
        }

        public void ClickOurMembersLink()
        {
            OurMembersLink.Click();
        }

        public void ClickAocJobsLink()
        {
            AocJobsLink.Click();
        }

        public void ClickTrainInYourOwnTimeLink()
        {
            TrainInYourOwnTimeLink.Click();
        }

        public void ClickFindAnFeTeachingJobLink()
        {
            FindAnFeTeachingJobLink.Click();
        }

        public bool EmailLinkDisplayed()
        {
            return EmailLink.Displayed;
        }

        #endregion
    }
}
