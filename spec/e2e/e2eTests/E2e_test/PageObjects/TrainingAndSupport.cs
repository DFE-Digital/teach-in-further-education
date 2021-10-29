using OpenQA.Selenium;

namespace TeachFe.E2e_test.PageObjects
{
    public class TrainingAndSupportPage
    {
        private readonly IWebDriver driver;
        public TrainingAndSupportPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement FullListOfQualificationsLink
        {
            get { return driver.FindElement(By.PartialLinkText("Here's a list of popular")); }
        }

        public IWebElement StudentFinanceLink
        {
            get { return driver.FindElement(By.PartialLinkText("You may be eligible to apply for a student loan")); }
        }

        public IWebElement EmployersLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find your local FE college")); }
        }

        public IWebElement AocJobsLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find a job in FE on the Association")); }
        }

        public IWebElement EmailLink
        {
            get { return driver.FindElement(By.LinkText("Teach.FE@education.gov.uk")); }
        }

        public IWebElement GuideToFurtherEducationLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find out more")); }
        }

        public IWebElement PcetLink
        {
            get { return driver.FindElement(By.PartialLinkText("PCET in Post-Compulsory")); }
        }

        public IWebElement DiplomaInEducationAndTrainingLink
        {
            get { return driver.FindElement(By.PartialLinkText("Diploma in Education")); }
        }

        public IWebElement BursariesAvailableLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find out about the current teacher")); }
        }

        #endregion

        #region Actions

        public bool ContentFinancialSupportDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickFullListOfQualificationsLink()
        {
            FullListOfQualificationsLink.Click();
        }

        public void ClickStudentFinanceLink()
        {
            StudentFinanceLink.Click();
        }

        public void ClickEmployersLink()
        {
            EmployersLink.Click();
        }

        public void ClickAocJobsLink()
        {
            AocJobsLink.Click();
        }

        public void ClickGuideToFurtherEducationLink()
        {
            GuideToFurtherEducationLink.Click();
        }

        public void ClickPcetLink()
        {
            PcetLink.Click();
        }

        public void ClickDiplomaInEducationAndTrainingLink()
        {
            DiplomaInEducationAndTrainingLink.Click();
        }

        public void ClickBursariesAvailableLink()
        {
            BursariesAvailableLink.Click();
        }

        #endregion

    }
}
