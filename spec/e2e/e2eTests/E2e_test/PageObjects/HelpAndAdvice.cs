using OpenQA.Selenium;


namespace TeachFe.E2e_test.PageObjects
{
    public class HelpAndAdvicePage
    {
        private readonly IWebDriver driver;
        public HelpAndAdvicePage(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement PhoneNumberLink
        {
            get { return driver.FindElement(By.LinkText("0800 389 2502")); }
        }

        public IWebElement CallChargesMayApplyLink
        {
            get { return driver.FindElement(By.LinkText("Call charges may apply")); }
        }

        public IWebElement EmailLink
        {
            get { return driver.FindElement(By.LinkText("Teach.FE@education.gov.uk")); }
        }

        #endregion

        #region Actions

        public bool ContentHelpAndAdviceDisplayed()
        {
            return MainContent.Displayed;
        }

        public bool PhoneNumberLinkDisplayed()
        {
            return PhoneNumberLink.Displayed;
        }

        public void ClickCallChargesMayApplyLink()
        {
            CallChargesMayApplyLink.Click();
        }

        public bool EmailLinkDisplayed()
        {
            return EmailLink.Displayed;
        }

        #endregion
    }
}
