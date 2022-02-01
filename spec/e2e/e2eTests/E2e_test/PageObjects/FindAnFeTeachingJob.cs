using OpenQA.Selenium;

namespace TeachFe.E2e_test.PageObjects
{
    public class FindAnFeTeachingJobPage
    {
        private readonly IWebDriver driver;
        public FindAnFeTeachingJobPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement CollegesLink
        {
            get { return driver.FindElement(By.PartialLinkText("The Association of Colleges")); }
        }

        public IWebElement AOEmploymentLink
        {
            get { return driver.FindElement(By.PartialLinkText("The Association of Employment Learning Providers")); }
        }

        public IWebElement AocJobsLink
        {
            get { return driver.FindElement(By.PartialLinkText("Association of colleges job site")); }
        }

        public IWebElement TesJobsLink
        {
            get { return driver.FindElement(By.PartialLinkText("TES - Times Educational")); }
        }

        public IWebElement FeJobsLink
        {
            get { return driver.FindElement(By.PartialLinkText("Further Education job")); }
        }

        public IWebElement CollegeJobsLink
        {
            get { return driver.FindElement(By.LinkText("College Jobs")); }
        }

        #endregion

        #region Actions

        public bool ContentFindAnFeTeachingJobDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickCollegesLink()
        {
            CollegesLink.Click();
        }

        public void ClickAOEmploymentLink()
        {
            AOEmploymentLink.Click();
        }

        public void ClickAocJobsLink()
        {
            AocJobsLink.Click();
        }

        public void ClickTesJobsLink()
        {
            TesJobsLink.Click();
        }

        public void ClickFeJobsLink()
        {
            FeJobsLink.Click();
        }

        public void ClickCollegeJobsLink()
        {
            CollegeJobsLink.Click();
        }

        #endregion
    }
}
