using NUnit.Framework;
using RestSharp;
using System.Net;

namespace TeachFeRequests
{
    public class HelpAndAdvice
    {
        [Test]
        public void HelpAndAdviceTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("help-and-advice.html", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
            Assert.IsNotNull(response);
        }
    }
}