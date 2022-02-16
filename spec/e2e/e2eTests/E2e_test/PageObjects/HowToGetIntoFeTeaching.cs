using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class HowToGetIntoFeTeachingPage
    {
        private readonly IWebDriver driver;
        public HowToGetIntoFeTeachingPage(IWebDriver driver)
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

        public IWebElement ApprenticeshipLink
        {
            get { return driver.FindElement(By.LinkText("apprenticeship")); }
        }

        public IWebElement WhatLevelsMeanLink
        {
            get { return driver.FindElement(By.LinkText("What levels mean")); }
        }

        public IWebElement FETeachingApprenticeshipLink
        {
            get { return driver.FindElement(By.LinkText("FE teaching apprenticeship")); }
        }

        public IWebElement TrainInYourOwnTimeLink
        {
            get { return driver.FindElement(By.PartialLinkText("train in your own time")); }
        }

        public IWebElement EmailLink
        {
            get { return driver.FindElement(By.LinkText("Teach.FE@education.gov.uk")); }
        }

        #endregion

        #region Actions

        public bool ContentHowToGetIntoFeTeachingPageDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickApplyForFEJobLink()
        {
            ApplyForFEJobLink.Click();
        }

        public void ClickApprenticeshipLink()
        {
            ApprenticeshipLink.Click();
        }

        public void ClickWhatLevelsMeanLink()
        {
            WhatLevelsMeanLink.Click();
        }

        public void ClickFETeachingApprenticeshipLink()
        {
            FETeachingApprenticeshipLink.Click();
        }

        public void ClickTrainInYourOwnTimeLink()
        {
            TrainInYourOwnTimeLink.Click();
        }

        public bool EmailLinkDisplayed()
        {
            return EmailLink.Displayed;
        }

        #endregion
    }
}
