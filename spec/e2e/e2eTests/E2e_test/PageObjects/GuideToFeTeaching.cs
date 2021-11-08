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

        public IWebElement TrainOnTheJobLink
        {
            get { return driver.FindElement(By.PartialLinkText("If you have significant career")); }
        }

        public IWebElement OpenAllButton
        {
            get { return driver.FindElement(By.ClassName("govuk-accordion__open-all")); }
        }

        public IWebElement AverageSalaryLink
        {
            get { return driver.FindElement(By.PartialLinkText("According to the National Careers")); }
        }

        public IWebElement EmployersLink
        {
            get { return driver.FindElement(By.PartialLinkText("Find your local FE college")); }
        }

        #endregion

        #region Actions

        public bool ContentGuideToFeDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickTrainOnTheJobLink()
        {
            TrainOnTheJobLink.Click();
        }

        public void ClickOpenAllButton()
        {
            OpenAllButton.Click();
        }

        public void ClickAverageSalaryLink()
        {
            AverageSalaryLink.Click();
        }

        public void ClickEmployersLink()
        {
            EmployersLink.Click();
        }


        #endregion
    }
}
