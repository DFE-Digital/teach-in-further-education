using NUnit.Framework;
using RestSharp;
using System.Net;

namespace TeachFeRequests
{
    public class ErrorCodes
    {
        [Test]
        public void InternalServerErrorTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("500.html", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
            Assert.IsNotNull(response);
        }

        [Test]
        public void NotFoundTest()
        {
            // arrange
            RestClient client = new RestClient("http://localhost:4567/");
            RestRequest request = new RestRequest("404.html", Method.GET);

            // act
            IRestResponse response = client.Execute(request);

            // assert
            Assert.That(response.StatusCode, Is.EqualTo(HttpStatusCode.OK));
            Assert.IsNotNull(response);
        }
    }
}
