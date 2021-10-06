using NUnit.Framework;
using RestSharp;
using System.Net;

namespace TeachFeRequests
{
    public class ExperienceAndQualifications
    {
        [Test]
        public void ExperienceAndQualificationsTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("experience-and-qualifications.html", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
            Assert.IsNotNull(response);
        }
    }
}