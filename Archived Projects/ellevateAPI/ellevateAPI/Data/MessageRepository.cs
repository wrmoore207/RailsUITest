namespace ellevateAPI.Data;

using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using Dapper;
using Microsoft.Extensions.Configuration;
using Npgsql;
using Models;

public class MessageRepository : IMessageRepository
{
    private readonly IConfiguration _configuration;

    public MessageRepository(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    private IDbConnection CreateConnection()
    {
        var connectionString = _configuration.GetConnectionString("DefaultConnection");
        return new NpgsqlConnection(connectionString);
    }

    public async Task<IEnumerable<Message>> GetAllMessagesAsync()
    {
        var sql = @"SELECT id, event_name AS EventName, start_timestamp AS StartTimestamp,
                           end_timestamp AS EndTimestamp, latitude, longitude
                    FROM messages
                    ORDER BY start_timestamp;";

        using var connection = CreateConnection();
        var messages = await connection.QueryAsync<Message>(sql);
        return messages;
    }

    public async Task<Message?> GetMessageByIdAsync(int id)
    {
        var sql = @"SELECT id, event_name AS EventName, start_timestamp AS StartTimestamp,
                           end_timestamp AS EndTimestamp, latitude, longitude
                    FROM messages
                    WHERE id = @Id;";

        using var connection = CreateConnection();
        var message = await connection.QueryFirstOrDefaultAsync<Message>(sql, new { Id = id });
        return message;
    }

    public async Task<Message> AddMessageAsync(Message message)
    {
        var sql = @"INSERT INTO messages (event_name, start_timestamp, end_timestamp, latitude, longitude)
                    VALUES (@EventName, @StartTimestamp, @EndTimestamp, @Latitude, @Longitude)
                    RETURNING id;";

        using var connection = CreateConnection();
        var newId = await connection.ExecuteScalarAsync<int>(sql, message);
        message.Id = newId;
        return message;
    }
}
