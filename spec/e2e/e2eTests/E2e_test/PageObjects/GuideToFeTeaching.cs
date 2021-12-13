using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class GuideToFeTeachingPage
    {
        private readonly IWebDriver driver;
        public GuideToFeTeachingPage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement AverageSalaryLink
        {
            get { return driver.FindElement(By.PartialLinkText("According to the National Careers")); }
        }

        public IWebElement EmployersLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find your local FE college")); }
        }

        public IWebElement TrainingProvidersLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find independent training providers")); }
        }

        public IWebElement WhatLevelsMeanLink
        {
            get { return driver.FindElement(By.PartialLinkText("What levels mean")); }
        }

        public IWebElement WhatYouCouldTeachLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find out what you could teach")); }
        }


        #endregion

        #region Actions

        public bool ContentGuideToFeDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickAverageSalaryLink()
        {
            AverageSalaryLink.Click();
        }

        public void ClickEmployersLink()
        {
            EmployersLink.Click();
        }

        public void ClickTrainingProvidersLink()
        {
            TrainingProvidersLink.Click();
        }

        public void ClickWhatLevelsMeanLink()
        {
            WhatLevelsMeanLink.Click();
        }

        public void ClickWhatYouCouldTeachLink()
        {
            WhatYouCouldTeachLink.Click();
        }

        #endregion
    }
}
