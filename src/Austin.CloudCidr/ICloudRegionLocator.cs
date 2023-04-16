using System.Net;

namespace Austin.CloudCidr;

public interface ICloudRegionLocator
{
    // TODO: consider making this return a ValueTask
    CloudRegion Lookup(IPAddress address);
}
