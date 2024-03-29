﻿using NUnit.Framework;
using OpenQA.Selenium.Chrome;
using TeachFe.E2e_test.PageObjects;

namespace TeachFe.E2e_test
{
    [TestFixture]
    public class UserJourneyTest
    {
        private ChromeDriver driver;

        [SetUp]
        public void StartBrowser()
        {
            driver = new ChromeDriver();
        }
        [Test]
        public void UserJourneyChromeDriver()
        {
            #region pages

            Navigation navigation = new Navigation(driver);
            CookieBanner cookieBanner = new CookieBanner(driver);
            CookiesPage cookiesPage = new CookiesPage(driver);
            Homepage homepage = new Homepage(driver);
            WhereToStartInFePage whereToStartInFePage = new WhereToStartInFePage(driver);
            WhatYouCouldTeachPage whatYouCouldTeachPage = new WhatYouCouldTeachPage(driver);
            TrainInYourOwnTimePage trainInYourOwnTimePage = new TrainInYourOwnTimePage(driver);
            FindAnFeTeachingJobPage findAnFeTeachingJobPage = new FindAnFeTeachingJobPage(driver);
            HowToGetIntoFeTeachingPage howToGetIntoFeTeachingPage = new HowToGetIntoFeTeachingPage(driver);
            HelpAndAdvicePage helpAndAdvicePage = new HelpAndAdvicePage(driver);
            ResultsNoQualificationsPage resultsNoQualificationsPage = new ResultsNoQualificationsPage(driver);
            ResultsGcsePage resultsGcsePage = new ResultsGcsePage(driver);
            ResultsAlevelsPage resultsAlevelsPage = new ResultsAlevelsPage(driver);
            ResultsDegreePage resultsDegreePage = new ResultsDegreePage(driver);
            Footer footer = new Footer(driver);
            AccessibilityAdvice accessibilityAdvice = new AccessibilityAdvice(driver);
            PrivacyPolicy privacyPolicy = new PrivacyPolicy(driver);
            SignUpToNewsletter signUpToNewsletter = new SignUpToNewsletter(driver);

            #endregion

            #region init

            navigation.NavigateToTest();
            Assert.AreEqual(true, homepage.ContentHomepageDisplayed());

            #endregion

            #region navigation

            navigation.ClickWhatYouCouldTeachNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/what-you-could-teach.html"));
            navigation.ClickHomeNavButton();

            #endregion

            #region cookie banner and cookie page

            cookieBanner.ClickAcceptCookiesButton();
            Assert.AreEqual(true, cookieBanner.CookieBannerAcceptedDisplayed());
            cookieBanner.ClickAcceptedHideThisMessageLink();
            //Go to cookies page via footer link
            footer.ClickCookiesLink();
            Assert.IsTrue(driver.Url.EndsWith("/cookies.html"));
            //redirects user to the cookies page
            Assert.AreEqual(true, cookiesPage.MainContentDisplayed());
            Assert.AreEqual(true, cookiesPage.CookiesFormDisplayed());
            cookiesPage.ClickGoogleAnalyticsCookiesLink();
            Assert.IsTrue(driver.Url.Equals("https://tools.google.com/dlpage/gaoptout"));
            driver.Navigate().Back();
            Assert.IsTrue(driver.Url.EndsWith("/cookies.html"));
            driver.ExecuteScript("scroll(0,-500)");
            cookiesPage.ClickRejectCookiesRadio();
            cookiesPage.ClickSubmitButton();
            //redirects user back to the homepage
            Assert.AreEqual(true, homepage.ContentHomepageDisplayed());
            // Assert.AreEqual(true, cookieBanner.CookieBannerRejectedDisplayed())

            #endregion

            #region homepage

            driver.Navigate().Refresh();
            navigation.ClickHomeNavButton();
            Assert.AreEqual(true, homepage.ContentHomepageDisplayed());
            homepage.ClickWhereToStartLink();
            Assert.IsTrue(driver.Url.EndsWith("/where-to-start-in-further-education.html"));
            navigation.ClickHomeNavButton();
            homepage.ClickWhereToStartLinkBottomPage();
            Assert.IsTrue(driver.Url.EndsWith("/where-to-start-in-further-education.html"));
            driver.Navigate().Back();
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            navigation.ClickWhereToStartInFeNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/where-to-start-in-further-education.html"));

            #endregion

            #region where to start in FE page

            whereToStartInFePage.ContentGuideToFeDisplayed();
            whereToStartInFePage.ClickEmployersLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            whereToStartInFePage.ClickTrainingProvidersLink();
            Assert.IsTrue(driver.Url.Contains("aelp.org.uk/about/our-members/"));
            driver.Navigate().Back();
            whereToStartInFePage.ClickWhatLevelsMeanLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels"));
            driver.Navigate().Back();
            whereToStartInFePage.ClickWhatYouCouldTeachLink();
            Assert.IsTrue(driver.Url.EndsWith("/what-you-could-teach.html"));
            driver.Navigate().Back();
            Assert.IsTrue(helpAndAdvicePage.PhoneNumberLink.Text.Equals("0800 389 2502"));
            helpAndAdvicePage.ClickCallChargesMayApplyLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/call-charges"));
            driver.Navigate().Back();
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            navigation.ClickWhatYouCouldTeachNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/what-you-could-teach.html"));

            #endregion

            #region what you could teach page

            Assert.AreEqual(true, whatYouCouldTeachPage.ContentWhatYouCouldTeachDisplayed());
            Assert.AreEqual(true, whatYouCouldTeachPage.ContentWhatYouCouldTeachDisplayed());
            whatYouCouldTeachPage.ClickOpenAllButton();
            whatYouCouldTeachPage.ClickWhatLevelsMeanLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels"));
            driver.Navigate().Back();
            whatYouCouldTeachPage.ClickTrainInYourOwnTimeLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            driver.Navigate().Back();
            Assert.IsTrue(helpAndAdvicePage.PhoneNumberLink.Text.Equals("0800 389 2502"));
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            driver.ExecuteScript("scroll(0,500)");
            whatYouCouldTeachPage.ClickGetStartedWithFeProviderLink();
            Assert.IsTrue(driver.Url.EndsWith("/how-to-get-into-fe-teaching.html"));

            #endregion

            #region how to get into fe teaching page

            Assert.AreEqual(true, howToGetIntoFeTeachingPage.ContentHowToGetIntoFeTeachingPageDisplayed());
            howToGetIntoFeTeachingPage.ClickApplyForFEJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/find-an-fe-teaching-job.html"));
            driver.Navigate().Back();
            howToGetIntoFeTeachingPage.ClickApprenticeshipLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/become-apprentice"));
            driver.Navigate().Back();
            howToGetIntoFeTeachingPage.ClickWhatLevelsMeanLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/what-different-qualification-levels-mean/list-of-qualification-levels"));
            driver.Navigate().Back();
            howToGetIntoFeTeachingPage.ClickFETeachingApprenticeshipLink();
            Assert.IsTrue(driver.Url.Contains("instituteforapprenticeships.org/apprenticeship-standards/learning-and-skills-teacher-v1-1"));
            driver.Navigate().Back();
            Assert.IsTrue(helpAndAdvicePage.PhoneNumberLink.Text.Equals("0800 389 2502"));
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            driver.ExecuteScript("scroll(0,500)");
            howToGetIntoFeTeachingPage.ClickTrainInYourOwnTimeLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));

            #endregion

            #region train in your own time

            Assert.AreEqual(true, trainInYourOwnTimePage.ContentTrainInYourOwnTimeDisplayed());
            trainInYourOwnTimePage.ClickFullListOfFeQualifications();
            Assert.IsTrue(driver.Url.EndsWith("/full-list-of-fe-qualifications.html"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickStudentFinanceLink();
            Assert.IsTrue(driver.Url.EndsWith("gov.uk/student-finance"));
            driver.Navigate().Back();
            driver.ExecuteScript("scroll(0,1100)");
            trainInYourOwnTimePage.ClickBursariesLink();
            Assert.IsTrue(driver.Url.EndsWith("gov.uk/government/publications/fe-funding-initial-teacher-education-ite-bursaries-2022-to-2023"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickTrainOnTheJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/how-to-get-into-fe-teaching.html"));
            driver.Navigate().Back();
            Assert.IsTrue(helpAndAdvicePage.PhoneNumberLink.Text.Equals("0800 389 2502"));
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            navigation.ClickFindAnFeTeachingJobNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/find-an-fe-teaching-job.html"));

            #endregion

            #region find an FE teaching job page

            Assert.AreEqual(true, findAnFeTeachingJobPage.ContentFindAnFeTeachingJobDisplayed());
            findAnFeTeachingJobPage.ClickCollegesLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickAOEmploymentLink();
            Assert.IsTrue(driver.Url.Contains("aelp.org.uk/about/our-members/"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickAocJobsLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/"));
            driver.Navigate().Back();
            driver.ExecuteScript("scroll(0,200)");
            findAnFeTeachingJobPage.ClickTesJobsLink();
            Assert.IsTrue(driver.Url.EndsWith("/further-education-teaching-and-lecturing"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickFeJobsLink();
            Assert.IsTrue(driver.Url.Contains("fejobs.com"));
            driver.Navigate().Back();
            driver.ExecuteScript("scroll(0,200)");
            findAnFeTeachingJobPage.ClickCollegeJobsLink();
            Assert.IsTrue(driver.Url.Contains("college.jobs.ac.uk/"));
            driver.Navigate().Back();
            Assert.IsTrue(helpAndAdvicePage.PhoneNumberLink.Text.Equals("0800 389 2502"));
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            navigation.ClickHelpAndAdviceNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/help-and-advice.html"));

            #endregion

            #region help and advice page

            Assert.AreEqual(true, helpAndAdvicePage.ContentHelpAndAdviceDisplayed());
            Assert.IsTrue(helpAndAdvicePage.PhoneNumberLink.Text.Equals("0800 389 2502"));
            Assert.IsTrue(helpAndAdvicePage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));
            helpAndAdvicePage.ClickCallChargesMayApplyLink();
            Assert.IsTrue(driver.Url.Contains("gov.uk/call-charges"));
            driver.Navigate().Back();


            #endregion

            #region sign up to our newsletter

            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            Assert.AreEqual(true, signUpToNewsletter.ContentSignUpToNewsletterDisplayed());
            Assert.IsTrue(signUpToNewsletter.EmailAddressLink.Text.Equals("TeachFE.newsletter@education.gov.uk"));

            #endregion

            #region footer

            footer.ClickAccessibilityLink();
            Assert.IsTrue(driver.Url.EndsWith("/accessibility-advice.html"));
            Assert.AreEqual(true, accessibilityAdvice.MainContentDisplayed());
            footer.ClickPrivacyLink();
            Assert.IsTrue(driver.Url.EndsWith("/privacy-policy.html"));
            Assert.AreEqual(true, privacyPolicy.MainContentDisplayed());
            footer.ClickCookiesLink();
            Assert.IsTrue(driver.Url.EndsWith("/cookies.html"));
            footer.ClickCopyrightLink();
            Assert.IsTrue(driver.Url.Equals("https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/"));
            driver.Navigate().Back();
            footer.ClickOGLLink();
            Assert.IsTrue(driver.Url.Equals("https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/"));
            driver.Navigate().Back();

            #endregion
        }
        [TearDown]
        public void CloseBrowser()
        {
            driver.Quit();
        }
    }
}
