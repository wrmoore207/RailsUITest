namespace ellevateAPI.Models;

public class Message
{
    public int Id { get; set; }
    public string EventName { get; set; } = string.Empty;
    public DateTime StartTimestamp { get; set; }
    public DateTime EndTimestamp { get; set; }
    public decimal Latitude { get; set; }
    public decimal Longitude { get; set; }
}