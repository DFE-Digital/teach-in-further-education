using OpenQA.Selenium;

namespace TeachFe.E2e_test.PageObjects
{
    public class AccessibilityAdvice
    {
        private readonly IWebDriver driver;
        public AccessibilityAdvice(IWebDriver driver)
        {
            this.driver = driver;
        }

        #region Elements

        public IWebElement MainContent
        {
            get { return driver.FindElement(By.Id("main-content")); }
        }

        public IWebElement JawsLink
        {
            get { return driver.FindElement(By.LinkText("JAWS")); }
        }

        public IWebElement NVDALink
        {
            get { return driver.FindElement(By.LinkText("NVDA")); }
        }

        public IWebElement VoiceOverLink
        {
            get { return driver.FindElement(By.LinkText("Apple VoiceOver")); }
        }

        public IWebElement AndroidTalkbackLink
        {
            get { return driver.FindElement(By.LinkText("Android Talkback")); }
        }

        public IWebElement AbilityWebLink
        {
            get { return driver.FindElement(By.PartialLinkText("visit AbilityNet")); }
        }

        public IWebElement GovUKAdviceLink
        { 
            get { return driver.FindElement(By.LinkText("You can also find advice on gov.uk")); }
        }

        public IWebElement DACAuditLink
        {
            get { return driver.FindElement(By.LinkText("The test was carried out by the Digital Accessibility Centre")); }
        }

        #endregion

        #region Actions

        public bool MainContentDisplayed()
        {
            return MainContent.Displayed;
        }

        public void ClickJawsLink()
        {
            JawsLink.Click();
        }

        public void ClickNVDALink()
        {
            NVDALink.Click();
        }

        public void ClickVoiceOverLink()
        {
            VoiceOverLink.Click();
        }

        public void ClickTakbackLink()
        {
            AndroidTalkbackLink.Click(); 
        }

        public void ClickAbilityWebLink()
        {
            AbilityWebLink.Click();
        }

        public void ClickGovUKAdviceLink()
        {
            GovUKAdviceLink.Click();
        }

        public void ClickDACAuditLink()
        {
            DACAuditLink.Click();
        }

        #endregion
    }
}
