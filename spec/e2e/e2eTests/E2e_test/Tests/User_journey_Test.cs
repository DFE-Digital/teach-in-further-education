using NUnit.Framework;
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
            TrainOnTheJobPage trainOnTheJobPage = new TrainOnTheJobPage(driver);
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

            driver.ExecuteScript("scroll(0,600)");
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
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            whatYouCouldTeachPage.ClickTrainOnTheJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-on-the-job.html"));

            #endregion

            #region train on the job page

            Assert.AreEqual(true, trainOnTheJobPage.ContentTrainOnTheJobDisplayed());
            trainOnTheJobPage.ClickAzEmployersLink();
            Assert.IsTrue(driver.Url.EndsWith("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickOurMembersLink();
            Assert.IsTrue(driver.Url.EndsWith("aelp.org.uk/about/our-members/"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickAocJobsLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickTrainInYourOwnTimeLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            driver.Navigate().Back();
            trainOnTheJobPage.ClickFindAnFeTeachingJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/find-an-fe-teaching-job.html"));
            driver.Navigate().Back();
            Assert.IsTrue(trainOnTheJobPage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            navigation.ClickTrainInYourOwnTimeNavButton();
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
            trainInYourOwnTimePage.ClickTrainOnTheJobLink();
            Assert.IsTrue(driver.Url.EndsWith("/train-on-the-job.html"));
            driver.Navigate().Back();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.AreEqual(true, trainInYourOwnTimePage.ValidationErrorMessageDisplayed());
            trainInYourOwnTimePage.ClickNoneRadioButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/results-no-quals.html"));
            Assert.AreEqual(true, resultsNoQualificationsPage.ContentNoQualificationsResultsDisplayed());
            resultsNoQualificationsPage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickGcseButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-gcse.html"));
            Assert.AreEqual(true, resultsGcsePage.ContentGcseResultsDisplayed());
            resultsGcsePage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickAlevelsButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/diploma-in-education-and-training-result-a-level.html"));
            Assert.AreEqual(true, resultsAlevelsPage.ContentAlevelsResultsDisplayed());
            resultsAlevelsPage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            trainInYourOwnTimePage.ClickDegreeButton();
            trainInYourOwnTimePage.ClickSubmitButton();
            Assert.IsTrue(driver.Url.EndsWith("/results-degree-or-above.html"));
            Assert.AreEqual(true, resultsDegreePage.ContentDegreeResultsDisplayed());
            resultsDegreePage.ClickBackButton();
            Assert.IsTrue(driver.Url.EndsWith("/train-in-your-own-time.html"));
            Assert.IsTrue(trainInYourOwnTimePage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            navigation.ClickFindAnFeTeachingJobNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/find-an-fe-teaching-job.html"));

            #endregion

            #region find an FE teaching job page

            Assert.AreEqual(true, findAnFeTeachingJobPage.ContentFindAnFeTeachingJobDisplayed());
            findAnFeTeachingJobPage.ClickEmployersLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/employers-a-z"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickAocJobsLink();
            Assert.IsTrue(driver.Url.Contains("aocjobs.com/"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickTesJobsLink();
            Assert.IsTrue(driver.Url.EndsWith("/further-education-teaching-and-lecturing"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickFeJobsLink();
            Assert.IsTrue(driver.Url.Contains("fejobs.com/career-advice"));
            driver.Navigate().Back();
            findAnFeTeachingJobPage.ClickCollegeJobsLink();
            Assert.IsTrue(driver.Url.Contains("college.jobs.ac.uk/"));
            driver.Navigate().Back();
            signUpToNewsletter.ClickSignUpToNewsletterButton();
            Assert.IsTrue(driver.Url.EndsWith("/sign-up-for-our-newsletter.html"));
            driver.Navigate().Back();
            navigation.ClickHelpAndAdviceNavButton();
            Assert.IsTrue(driver.Url.EndsWith("/help-and-advice.html"));

            #endregion

            #region help and advice page

            Assert.AreEqual(true, helpAndAdvicePage.ContentHelpAndAdviceDisplayed());
            Assert.IsTrue(helpAndAdvicePage.EmailLink.Text.Equals("Teach.FE@education.gov.uk"));

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
