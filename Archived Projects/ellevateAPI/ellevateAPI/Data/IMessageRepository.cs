namespace ellevateAPI.Data;

using System.Collections.Generic;
using System.Threading.Tasks;
using ellevateAPI.Models;

public interface IMessageRepository
{
    Task<IEnumerable<Message>> GetAllMessagesAsync();
    Task<Message?> GetMessageByIdAsync(int id);
    Task<Message> AddMessageAsync(Message message);
}