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

        public IWebElement FullListOfFeQualificationsLink
        {
            get { return driver.FindElement(By.PartialLinkText("Here's a list of popular teacher")); }
        }

        public IWebElement StudentFinanceLink
        {
            get { return driver.FindElement(By.PartialLinkText("You may be eligible to apply for a student loan")); }
        }

        public IWebElement AzEmployersLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find your local FE college on the Association")); }
        }

        public IWebElement OurMembersLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find independent training providers on the Association")); }
        }

        public IWebElement AocJobsLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find a job in FE on the Association of Colleges")); }
        }

        public IWebElement TrainInYourOwnTimeLink
        {
            get { return driver.FindElement(By.LinkText("Train in your own time")); }
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

        public void ClickFullListOfFeQualificationsLink()
        {
            FullListOfFeQualificationsLink.Click();
        }

        public void ClickStudentFinanceLink()
        {
            StudentFinanceLink.Click();
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
