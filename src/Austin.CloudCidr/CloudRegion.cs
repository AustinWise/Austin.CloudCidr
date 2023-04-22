namespace Austin.CloudCidr;

public readonly struct CloudRegion
{
    internal readonly int _prefixLength;
    private readonly string _region;
    public CloudProvider Provider { get; }
    public string Region => Provider == default ? throw new InvalidOperationException() : _region;

    public CloudRegion(CloudProvider provider, string region, int prefixLength)
    {
        ArgumentNullException.ThrowIfNullOrEmpty(region);
        if (ulong.PopCount(((ulong)provider)) != 1)
            throw new ArgumentOutOfRangeException(nameof(provider), "Provider must be a specific provider.");

        this.Provider = provider;
        this._region = region;
        this._prefixLength = prefixLength;
    }
}
