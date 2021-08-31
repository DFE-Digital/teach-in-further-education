import http from "k6/http";
import { check } from "k6";
import { sleep } from 'k6';

const username = 'teachfe';
const password = 'efhcaet';

export let options = {
  stages: [
    { duration: "30s", target: 5 },
    { duration: "1m30s", target: 10 },
    { duration: "20s", target: 0 },
  ],
};

export default function() {
    const credentials = `${username}:${password}`;

  // Passing username and password as part of the URL to allow us to authenticate using HTTP Basic Auth.
  const url = `https://${credentials}@teach-in-further-education-dev.london.cloudapps.digital/basic-auth/${username}/${password}`;

  let res = http.get(url);

  // Verify response
  check(res, {
    'status is 404': (r) => r.status === 404,
	"transaction time OK": (r) => r.timings.duration < 250
	});
	
  const urlHome = `https://teachfe:efhcaet@teach-in-further-education-dev.london.cloudapps.digital/`;

  let resHome = http.get(urlHome);

  // Verify response
  check(resHome, {
    'status is 200': (r) => r.status === 200,
	"transaction time OK on homepage": (r) => r.timings.duration < 250
	});

  const urlGuidetoFE = `https://teachfe:efhcaet@teach-in-further-education-dev.london.cloudapps.digital/guide-to-further-education.html`;

  let resGuideToFE = http.get(urlGuidetoFE);

  // Verify response
  check(resGuideToFE, {
    'status is 200 on guide to FE page': (r) => r.status === 200,
	"transaction time OK on guide to FE page": (r) => r.timings.duration < 250
	});
  sleep(3);
}
