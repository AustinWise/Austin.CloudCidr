
There are a number of design considerations to make.

# Hard-coded list versus dynamically updating list

The answer to this question might be "why not both". There could be two versions of this library:
one that is static only and one that also includes dynamic download.

Regardless of whether dynamically updating IP addresses while running is implemented, a hard coded
list of IPs is probably needed. Servers that don't have outbound internet access would need the
list hard coded. Having a list hard coded can also reduce startup times, since you don't have to
wait for a dynamic update to start classifying IPs. And finally if the IP address description files
are unavailable, having a hardcoded list would be helpful.

Pros of purely static:

* Simpler
* Easier to test

Pros of adding dynamic

* Can update IPs without rebuilding app

# Data structure

How to efficiently lookup information about an IP address. Some sort of tree? Binary search?
Some benchmarks will be needed.

# Format for hard-coded data

If the library supports dynamic IP updates, we can just embed a copy of the JSON files from the
cloud providers. If dynamic update is not supported, we could potentially normalize all the formats
at build time to reduce binary size and startup time.

# More Cloud Support

Currently I have identified the following:

* [Google Cloud](https://support.google.com/a/answer/10026322?hl=en) - no update frequency specified
* [AWS](https://docs.aws.amazon.com/vpc/latest/userguide/aws-ip-ranges.html) - no update frequency specified
* [Azure](https://www.microsoft.com/en-us/download/details.aspx?id=56519) - updated weekly
