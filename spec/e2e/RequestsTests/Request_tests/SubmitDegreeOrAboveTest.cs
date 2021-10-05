using NUnit.Framework;
using RestSharp;
using System.Net;

namespace TeachFeRequests
{
    public class SubmitDegreeOrAbove
    {
        [Test]
        public void SubmitDegreeOrAboveTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("results-degree-or-above.html", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
            Assert.IsNotNull(response);
        }

        [Test]
        public void SubmitDegreeOrAbovePostTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("results-degree-or-above.html", Method.POST);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }

        [Test]
        public void SubmitDegreeOrAboveDeleteTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("results-degree-or-above.html", Method.DELETE);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
        }
    }
}