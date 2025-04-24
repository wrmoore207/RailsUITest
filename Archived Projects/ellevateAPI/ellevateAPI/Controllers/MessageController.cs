using ellevateAPI.Models;
using Microsoft.AspNetCore.Mvc;
using ellevateAPI.Data;

namespace ellevateAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MessagesController : ControllerBase
    {
        private readonly IMessageRepository _messageRepository;

        public MessagesController(IMessageRepository messageRepository)
        {
            _messageRepository = messageRepository;
        }

        // GET: api/messages
        [HttpGet]
        public async Task<IActionResult> GetAllMessages()
        {
            var messages = await _messageRepository.GetAllMessagesAsync();
            return Ok(new { data = messages });
        }

        // GET: api/messages/{messageId}
        [HttpGet("{id}")]
        public async Task<IActionResult> GetMessageById(int id)
        {
            var message = await _messageRepository.GetMessageByIdAsync(id);
            if (message == null)
                return NotFound(new { error = "Message not found" });

            return Ok(new { data = message });
        }

        // POST: api/messages
        [HttpPost]
        public async Task<IActionResult> AddMessage([FromBody] Message newMessage)
        {
            if (newMessage == null ||
                string.IsNullOrWhiteSpace(newMessage.EventName) ||
                newMessage.StartTimestamp == default ||
                newMessage.EndTimestamp == default)
            {
                return BadRequest(new { error = "Invalid input data" });
            }

            var savedMessage = await _messageRepository.AddMessageAsync(newMessage);
            return Ok(new { message = "Message received and processed.", data = savedMessage });
        }
    }
}
