using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class Homepage
    {
        private readonly IWebDriver driver;
        private readonly string url = "https://teachfe:efhcaet@teach-in-further-education-dev.london.cloudapps.digital/";
        public Homepage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements
        public IWebElement MainContent
        {
            get { return driver.FindElement(By.ClassName("govuk-grid-row")); }
        }

        public IWebElement GuideToFeTeachingNavButton
        {
            get { return driver.FindElement(By.Id("5yYjsBia5tKnn6rysEdUQ2")); }
        }

        public IWebElement ExperienceAndQualificationsNavButton
        {
            get { return driver.FindElement(By.Id("630Q4flj9fmCaHKsckbOA6")); }
        }

        #endregion

        #region Actions

        public void NavigateTo()
        {
            driver.Navigate().GoToUrl(url);
        }

        public bool ContentHomepageDisplayed()
        {
            return _ = MainContent.Displayed;
        }

        public void ClickGuideToFeTeachingNavButton()
        {
            GuideToFeTeachingNavButton.Click();
        }

        public void ClickExperienceAndQualificationsNavButton()
        {
            ExperienceAndQualificationsNavButton.Click();
        }

        #endregion
    }
}
